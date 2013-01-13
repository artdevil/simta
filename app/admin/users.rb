ActiveAdmin.register User do
  index do
  	column :id_key
  	column :username
  	column :department
  	column :email
  	default_actions
  end

  action_item :only => :index do
    link_to 'Upload user data', upload_admin_users_path
  end

  collection_action :upload_user, :method => :post
  
  collection_action :upload do
    @user = User.new
  end

  controller do
  	def upload_user
  		@user = User.new
  		spreadsheet = Excelx.new(params[:url].path,false, :ignore)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        @user.attributes = row.to_hash
        @user.save!
      end
  		redirect_to admin_users_path
  	end
  end
end
