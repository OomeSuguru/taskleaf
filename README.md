
= form_with model: [:admin, @user], local: true do |f|
  .form_group
    = f.label :name, '名前'
    =f.text_field :name, class: 'form-control'
  .form_group
    = f.label :email, 'メールアドレス'
    =f.email_field :email, class: 'form-control'
  .form_check
    = f.label :admin, class: 'form-check-label' do
      = f.check_box :admin, class: 'form-check-input'
      | 管理者権限
  .form_group
    = f.label :password, 'パスワード'
    = f.password_field :password, class: 'form-control'
  .form_group
    = f.label :password_confirmation, 'パスワード(確認)'
    = f.password_field :password_confirmation, class: 'form-control'
  = f.submit '登録する', class: 'btn btn-primary' 

  class AddUserIdToTasks < ActiveRecord::Migration[5.2]

  def up
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end
end
= render partial: 'form', locals: { task: @task }

@task.save!
      logger.debug "task: #{@task.attributes.inspect}"
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました"