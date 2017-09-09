class ImageFilesController < ApplicationController
  # https://cre8cre8.com/rails/upload-image.htm
  def create
    uploaded_file = fileupload_param[:file]
    filename = uploaded_file.original_filename
    output_path = Rails.root.join('public/img', filename)

    File.open(output_path, 'w+b') do |fp|
      fp.write  uploaded_file.read
    end
  #   TODO:: ここでshell叩こう
  #   返り値によってrenderのページを変更する
    cmd = 'pwd'
    res = `#{cmd}`
    case res
      when 0 then
        # redirect_to :action => 'index'
      when 1 then
        # redirect_to :action => 'index'
      when 2 then
        # redirect_to :action => 'index'
      else
        # redirect_to :action => 'index'
    end
  end

  def index
    @re = 'TEST'
  end


  private
  def fileupload_param
    params.require(:fileupload).permit(:file)
  end

end
