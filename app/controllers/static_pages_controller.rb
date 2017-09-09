class StaticPagesController < ApplicationController
  def index
  end

  def create
    if params[:fileupload].nil?
      return redirect_to '/', danger: '画像を選択してください'
    end
    uploaded_file = params[:fileupload][:file]
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
      when '0' then
        redirect_to '/0'
      when '1' then
        redirect_to '/1'
      when '2' then
        redirect_to '/2'
      else
        redirect_to '/0'
    end
  end

  def show
    @id = params[:id]
  end
end
