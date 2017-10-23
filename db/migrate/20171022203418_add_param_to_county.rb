class AddParamToCounty < ActiveRecord::Migration[5.1]
  def change
    add_column :counties, :param, :string
  end
end
