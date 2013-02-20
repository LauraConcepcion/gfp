# RailsAdmin config file. Generated on January 15, 2013 10:03
# See github.com/sferik/rails_admin for more informations
RailsAdmin.config do |config|
  #config.authorize_with :cancan
  
  config.model 'Aacce' do
    include_all_fields
    exclude_fields :institutes, :departments
  end 
  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions 
    index                         # mandatory
    new
    export
    import
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app
  end
end
