module Api
  module V1
      class UsersController < ApiController
        def profile
        	if @user.present?
        		@profile =  {Name: @user.try(:name), Age: @user.try(:age), Gender: @user.try(:gender), Email: @user.try(:email), Image_url_status: @user.image.present? , Image_url: @user.image.url}
          	render json: {success: true, user_profile: @profile, message: "Profile"}
          else
          	render json: {success: false, message: "User not Found"}
          end
        end

        def user_detail
          @user_detail = @user
          if @user.present?
            render json:{success: true, user_name: @user.name, user_mail: @user.email, user_image_status: @user.image.present?, user_image_url: @user.image.url }
          else
            render json: {success: false, message: "User detail not Found"}
          end
        end

        def profile_edit
          if @user.present?
            begin
              if params[:image].present?
                data = params[:image].gsub(" ", "+")
                data_uri = data.split(",")[1]
                extention = "png"
                encoded_image = data_uri
                decoded_image = Base64.decode64(encoded_image)
                img_name = "tmp/img_#{Time.now.to_i}.#{extention}"
                File.open(img_name, "wb") { |f| f.write(decoded_image) }
                @user.image = File.open(img_name)
                @user.save
              end
            rescue Exception => e
              p "something went wrong"
              p e
            end
            @user.update(user_params)
            p 'profile_edit errors'
            p @user.errors
            render json: {success: true, message: 'User update successfully'}
          else
            render json: {success: false, message: 'User not found'}
          end
        end

        def profile_detail
          if @user.present?
            render json: {success: true, user: @user}
          else
            render json: {success: false, message: 'User not found'}
          end
        end

        def user_signout
          p "desvise destroy details"
          render json: {success: true, message: "successfully signout"}
        end

        private

        def user_params
          params.require(:user).permit(:id, :name, :age, :gender, :email, :password, :password_confirmation, :image, :role_id)
        end
      end
  end
end