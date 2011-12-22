module Admin::ImagesHelper
  def s3_uploader(options = {})
    options[:s3_config_filename] ||= "#{Rails.root}/config/s3.yml"
    config = YAML.load_file(options[:s3_config_filename])[Rails.env].symbolize_keys
    bucket            = config[:bucket]
    access_key_id     = config[:access_key_id]
    secret_access_key = config[:secret_access_key]

    options[:key] ||= 'test'  # folder on AWS to store file in
    options[:acl] ||= 'public-read'
    options[:expiration_date] ||= 10.hours.from_now.utc.iso8601
    options[:max_filesize] ||= 500.megabytes
    options[:content_type] ||= 'images/' # Videos would be binary/octet-stream
    options[:filter_title] ||= 'All'
    options[:filter_extentions] ||= 'jpg,jpeg,gif,png,bmp,pdf,docx'
    options[:browse_button] ||= 'pickfiles'
    options[:button_text] ||= 'Select File'
    options[:stored_folder] ||= 'attachment'
    id = options[:id] ? "_#{options[:id]}" : ''
    folder = UUID.generate

    policy = Base64.encode64(
      "{'expiration': '#{options[:expiration_date]}',
        'conditions': [
          {'bucket': '#{bucket}'},
          {'acl': '#{options[:acl]}'},
          {'success_action_status': '201'},
          ['content-length-range', 0, #{options[:max_filesize]}],
          ['starts-with', '$key', ''],
          ['starts-with', '$Content-Type', ''],
          ['starts-with', '$name', ''],
          ['starts-with', '$Filename', '']
        ]
      }").gsub(/\n|\r/, '')

    signature = Base64.encode64(
                  OpenSSL::HMAC.digest(
                    OpenSSL::Digest::Digest.new('sha1'),
                    secret_access_key, policy)).gsub("\n","")

    out = ""
     upload_url = "http://#{bucket}.s3.amazonaws.com/"
    out << "<a class='medium silver button ram #{options[:button_class]}' href='#' id='#{options[:browse_button]}'>#{options[:button_text]}</a>"

    out << javascript_tag("
      var upload_url = 'http://#{bucket}.s3.amazonaws.com/';
          acl_option = '#{options[:acl]}';
          content_type_option = '#{options[:content_type]}',
          access_key_id = '#{access_key_id}';
          upload_policy = '#{policy}';
          upload_signature = '#{signature}';
          option_filter_title = '#{options[:filter_title]}';
          option_filter_extension = '#{options[:filter_extentions]}';
          path_to_file = '#{folder}';
    ")
    out << javascript_tag("
      $(function() {
        /*
        * S3 Uploader instance
        */
        // image uploader via plupload
        var uploader = new plupload.Uploader({
          runtimes : 'flash,silverlight,html5',
          browse_button : '#{options[:browse_button]}',
          max_file_size : '#{options[:max_filesize]}',
          url : '#{upload_url}',
          flash_swf_url: '/javascripts/plupload/plupload.flash.swf',
          silverlight_xap_url: '/javascripts/plupload/plupload.silverlight.xap',
          init : {
            FilesAdded: function(up, files) {
              plupload.each(files, function(file) {
                if (up.files.length > 1) {
                  up.removeFile(file);
                }
              });
              if (up.files.length >= 1) {
                $('##{options[:browse_button]}').fadeOut('slow');
              }
            },
            FilesRemoved: function(up, files) {
              if (up.files.length < 1) {
                $('##{options[:browse_button]}').fadeIn('slow');
              }
            }
          },
          multi_selection: false,
          multipart: true,
          multipart_params: {
            'key': '#{options[:stored_folder]}/#{folder}/${filename}',
            'Filename': '${filename}', // adding this to keep consistency across the runtimes
                        'acl': '#{options[:acl]}',
                        'Content-Type': '#{options[:content_type]}',
                        'success_action_status': '201',
                        'AWSAccessKeyId' : '#{access_key_id}',
                        'policy': '#{policy}',
                        'signature': '#{signature}' 
           },
          filters : [
              {title : '#{options[:filter_title]}', extensions : '#{options[:filter_extentions]}'}
          ],
          file_data_name: 'file'
        });

        // instantiates the uploader
        uploader.init();

        // binds progress to progress bar
        uploader.bind('UploadProgress', function(up, file) {
          if(file.percent < 100){
              $('#progress_bar .ui-progress').css('width', file.percent+'%');
          }
          else {
              $('#progress_bar .ui-progress').css('width', '100%');
              $('span.ui-label').text('Complete');
          }
        });

        // shows error object in the browser console (for now)
        uploader.bind('Error', function(up, error) {
          // unfortunately PLUpload gives some extremely vague
          // Flash error messages so you have to use WireShark
          // for debugging them (read the README)
          alert('There was an error.  Check the browser console log for more info');
          console.log('Expand the error object below to see the error. Use WireShark to debug.');

          console.log(error);
        });

        $('form').submit(function(e){

           if (uploader.files.length > 0) {
            // When all files are uploaded submit form
             uploader.bind('FileUploaded', function(up, file) {
               if (uploader.files.length === (uploader.total.uploaded + uploader.total.failed)) {
                 $('#remote_attachment_net_url').val(upload_url + 'attachment/' + path_to_file + '/' + file.name);
                  console.log($('#remote_attachment_net_url').val());
                 $('form')[0].submit();
                 }
               });
             $('#progress_bar .ui-progress').css('width', '5%');
             $('span.ui-label').show();
             $('#progress_bar').show('fast', function () {
               uploader.start();
             });
           };


          return false;
        });

      });
      
     ") 
  end
end

