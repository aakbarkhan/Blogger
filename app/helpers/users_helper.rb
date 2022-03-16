module UsersHelper
  def user_img(user)
    user.photo.present? ? user.photo : 'https://images.unsplash.com/photo-1604537466573-5e94508fd243?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'
  end
end
