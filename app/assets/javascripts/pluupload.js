/*$(function() {*/
/*  *//**/
/** S3 Uploader instance*/
/*  */
/*// image uploader via plupload*/
/*var uploader = new plupload.Uploader({*/
/*runtimes : 'flash,silverlight',*/
/*browse_button : 'pickfiles',*/
/*max_file_size : '500mb',*/
/*url : upload_url,*/
/*flash_swf_url: '/javascripts/plupload/plupload.flash.swf',*/
/*silverlight_xap_url: '/javascripts/plupload/plupload.silverlight.xap',*/
/*init : {*/
/*FilesAdded: function(up, files) {*/
/*plupload.each(files, function(file) {*/
/*if (up.files.length > 1) {*/
/*up.removeFile(file);*/
/*}*/
/*});*/
/*if (up.files.length >= 1) {*/
/*$('#pickfiles').fadeOut('slow');*/
/*}*/
/*},*/
/*FilesRemoved: function(up, files) {*/
/*if (up.files.length < 1) {*/
/*$('#pickfiles').fadeIn('slow');*/
/*}*/
/*}*/
/*},*/
/*multi_selection: false,*/
/*multipart: true,*/
/*multipart_params: {*/
/*'key': 'attachment/' + path_to_file + '/${filename}',*/
/*'Filename': '${filename}', // adding this to keep consistency across the runtimes*/
/*'acl': acl_option,*/
/*'Content-Type': content_type_option,*/
/*'success_action_status': '201',*/
/*'AWSAccessKeyId' : access_key_id,*/
/*'policy': upload_policy,*/
/*'signature': upload_signature*/
/*},*/
/*filters : [*/
/*{title : option_filter_title, extensions : option_filter_extension}*/
/*],*/
/*file_data_name: 'file'*/
/*});*/

/*// instantiates the uploader*/
/*uploader.init();*/

/*// binds progress to progress bar*/
/*uploader.bind('UploadProgress', function(up, file) {*/
/*if(file.percent < 100){*/
/*$('#progress_bar .ui-progress').css('width', file.percent+'%');*/
/*}*/
/*else {*/
/*$('#progress_bar .ui-progress').css('width', '100%');*/
/*$('span.ui-label').text('Complete');*/
/*}*/
/*});*/

/*// shows error object in the browser console (for now)*/
/*uploader.bind('Error', function(up, error) {*/
/*// unfortunately PLUpload gives some extremely vague*/
/*// Flash error messages so you have to use WireShark*/
/*// for debugging them (read the README)*/
/*alert('There was an error.  Check the browser console log for more info');*/
/*console.log('Expand the error object below to see the error. Use WireShark to debug.');*/

/*console.log(error);*/
/*});*/

/*$("form").submit(function(e){*/

/*if (uploader.files.length > 0) {*/
/*// When all files are uploaded submit form*/
/*uploader.bind('FileUploaded', function(up, file) {*/
/*if (uploader.files.length === (uploader.total.uploaded + uploader.total.failed)) {*/
/*$("#remote_attachment_net_url").val(upload_url + 'attachment/' + path_to_file + '/' + file.name);*/
/*console.log($("#remote_attachment_net_url").val());*/
/*$('form')[0].submit();*/
/*}*/
/*});*/
/*$('#progress_bar .ui-progress').css('width', '5%');*/
/*$('span.ui-label').show();*/
/*$('#progress_bar').show('fast', function () {*/
/*uploader.start();*/
/*});*/
/*};*/


/*return false;*/
/*});*/

/*});*/

