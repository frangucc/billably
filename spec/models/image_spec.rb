require 'spec_helper'

describe Image do
  describe "Associations" do
    it { should belong_to :merchant }
    it { should belong_to :package }
  end

  describe 'Class Methods' do 
    it 'self.process_in_background should process image in background' do
      image = Image.new
      path = "path-to-image"
      image.should_receive(:remote_attachment_url=).with(path).and_return(path)
      image.should_receive(:processing=).with(false).and_return(false)
      Image.process_in_background(image, path).should == image.save!
    end
  end

  describe 'Database Columns' do
    it { should have_db_column(:attachment).of_type(:string) }
    it { should have_db_column(:processing).of_type(:boolean) }
  end

  describe "Factory" do
    it "should be valid" do
      image = create :image
      image.valid?.should be_true
    end
  end

  describe "Instance Methods" do
    describe "save_and_process_attachment" do
      before(:each) do
        @image = Image.new
      end
      it "should process intermediately" do
        path = 'path-to-image' 
        @image.stub!(:remote_attachment_url).and_return(path)
        @image.stub!(:save!).and_return(true)
        @image.save_and_process_attachment({:now => true}).should be_true
      end
      it "should call delay job worker" do
        path = 'path-to-image' 
        @image.stub!(:remote_attachment_url).and_return(path)
        @image.should_receive(:remote_attachment_url=).with(nil).and_return(nil)
        @image.should_receive(:processing=).with(true).and_return(true)
        @image.should_receive(:save!).and_return(true)
        @image.save_and_process_attachment({:now => false})
      end
    end
  end

  describe 'Validations' do
    describe 'should validate that either merchant or package exist' do
      it 'validates merchant exists' do
        pending
      end

      it 'validates merchant exists' do
        pending
      end

      it 'fails if neither exist' do
        pending
      end
    end

  end
end
