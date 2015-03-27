ActiveAdmin.register MedicationRoute do
  actions :all, :except => [:destroy]
  permit_params :name, :description
  # filter :id, as: :numeric, label: 'ID'
  filter :name
  filter :description
  

  menu parent: "Reference Data"
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end