class GroupRelationship < ApplicationRecord
  belongs_to :group
  belongs_to :user

     def join
    @group = Group.find(params[:id])

     if !current_user.is_member_of?(@group)
       current_user.join!(@group)
       flash[:notice] = "加入本讨论版成功！"
     else
       flash[:warning] = "你已经是本讨论版成员了！"
     end

     redirect_to group_path(@group)
   end

   def quit
     @group = Group.find(params[:id])

     if current_user.is_member_of?(@group)
       current_user.quit!(@group)
       flash[:alert] = "已退出本讨论版！"
     else
       flash[:warning] = "你不是本讨论版成员，怎么退出 XD"
     end

     redirect_to group_path(@group)
   end

    private

end
