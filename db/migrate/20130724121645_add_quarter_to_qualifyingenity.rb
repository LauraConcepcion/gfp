class AddQuarterToQualifyingenity < ActiveRecord::Migration
  def change
    add_column :qualifyingentities, :quarter_id, :integer
    add_column :quarters, :start_date, :date
    add_column :quarters, :end_date, :date

    Quarter.create  name:  'Primer Trimestre',
      start_date: '13/09/2013',
      end_date: '20/12/2013'
    Quarter.create  name:  'Segundo Trimestre',
      start_date: '09/01/2014',
      end_date: '21/03/2014'

    Quarter.create  name:  'Tercer Trimestre',
      start_date: '24/03/2014',
      end_date: '20/06/2014'
  end
end
