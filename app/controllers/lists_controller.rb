class ListsController < ApplicationController
  def index
    @lists = List.all.order(date: :desc)
  end

  def check_box
    @list = List.find_by(id: params[:id])
    
    @list.update(check_box: !(@list.check_box))
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path, notice: "設定新目標成功！"
    else
      render :new
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def destroy
    @list = List.find_by(id: params[:id])
    @list.destroy if @list
    redirect_to lists_path, notice: "已刪除"
  end

  def update
    @list = List.find_by(id: params[:id])

    if @list.update(list_params)
      redirect_to lists_path, notice: "更新目標成功！"
    else
      render :new
    end

  end



  private

  def list_params
    params.require(:list).permit(:name, :date, :note)
  end

end
