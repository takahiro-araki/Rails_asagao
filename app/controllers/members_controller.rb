class MembersController < ApplicationController
    #会員一覧表示
    def index 
        @members=Member.order("number")
    end
    def show
        @member=Member.find(params[:id])
    end
    
def search
    @members=Member.search(params[:q])
    render "index"
end


    def new
        @member=Member.new(birthday: Date.new(1992,1,13))
    end
    def edit
        @member=Member.find(params[:id])
    end
    def create
       @member=Member.new(params[:member])
       if @member.save
        redirect_to @member,notice: "会員を登録しました。"
       else
        render "new" 
       end
    end

    def update
        @member=Member.find(params[:id])
        @member.assign_attributes(params[:member])
        if @member.save
            redirect_to @member, notice: "会員情報を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @member=Member.find(params[:id])
        @member.destroy
        redirect_to :members,motice: "会員を削除しました"
    end

end
