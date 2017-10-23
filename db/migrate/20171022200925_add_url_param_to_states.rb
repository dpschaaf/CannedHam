class AddUrlParamToStates < ActiveRecord::Migration[5.1]
  def change
    add_column :states, :param, :string
    add_index :states, :param
  end
end
