class Admin::IntrosController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!
  # 使用者必須是 admin 身份
  before_action :admin_required
  # 後台頁面排版
  layout "admin"

  def index
    @intros = Intro.all
  end

  def new
    @intro = Intro.new
  end

  def create
    @intro = Intro.new(intro_params)

    if @intro.save
      redirect_to admin_intros_path, notice: '廣告新增成功'
    else
      render :new
    end
  end

  def edit
    @intro = Intro.find(params[:id])
  end

  def update
    @intro = Intro.find(params[:id])
    @intro.update(intro_params)
    if @intro.save
      redirect_to admin_intros_path, notice: '廣告修改成功'
    else
      render :edit
    end
  end

  def destroy
    @intro = Intro.find(params[:id])
    @intro.destroy
      redirect_to admin_intros_path, notice: '廣告刪除成功'
  end

  # 發佈
  def publish
    @intro = Intro.find(params[:id])
    @intro.publish!
    redirect_to :back
  end

  # 隱藏
  def hide
    @intro = Intro.find(params[:id])
    @intro.hide!
    redirect_to :back
  end

private

  def intro_params
    params.require(:intro).permit(:title, :content, :link, :image, :is_hidden)
  end

end
