class AddUrlParamToStates < ActiveRecord::Migration[5.1]
  def change
    change_table :states do |t|
      t.string :param, index: true
    end

    State.all.each do |state|
      state.param = state.name.parameterize
      state.save
      puts "Updated #{state.name} - #{state.param}"
    end
  end
end
