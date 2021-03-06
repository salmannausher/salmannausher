ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params do
  permitted = [:title, :image, :url]
  permitted
end

index do
    selectable_column
    id_column
    column :title
    column :image
    column :url
    actions
  end
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Project" do
      f.input :title, required: true
      f.input :url
      f.input :image, required: true, as: :file, :hint => (f.template.image_tag(f.object.image.url(:medium)) if f.object.image )
    end
    f.actions
  end

  show do |project|
    attributes_table do
      row :title
      row :url
      row "image" do
        ul do
          image_tag(project.image.url(:medium))
        end
      end
    end
  end
end
