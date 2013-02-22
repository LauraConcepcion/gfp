class CustomAdminController < RailsAdmin::MainController
  before_filter :authenticate_user!
  def import
    #TODO
    if request.post?
      response = { :errors => [], :success => [] }
      file = CSV.new(params[:file].tempfile)
      
      # Build map of attributes based on first row
      map {}
      file.readline.each_with_index { |key, i| map[key.to_sym] = i }
                
      file.each do |row|
      # Build hash of attributes
        new_attrs = @abstract_model.model::IMPORT_FIELDS.inject({}) { |hash, a| hash[a] = row[map[a]] if map[a] }
                                   
        # Instantiate object
        object = @abstract_model.model.new(new_attrs)
                                                
        # Additional special stuff here
                                                      
        # Save
        if object.save
          response[:success] << "Created: #{object.title}"
        else
          response[:error] << "Failed to create: #{object.title}. Errors: #{object.errors.full_messages.join(', ')}."
        end
      end
    end
  end
end
