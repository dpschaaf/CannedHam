class CreateJoinTableSeoLandingPages < ActiveRecord::Migration[5.1]
  def change
    create_table :seo_landing_pages do |t|
      t.belongs_to :state
      t.belongs_to :county
      t.belongs_to :city
      t.string :path
      t.timestamps
    end
    add_foreign_key :seo_landing_pages, :cities
    add_foreign_key :seo_landing_pages, :counties
    add_foreign_key :seo_landing_pages, :states
    add_index :seo_landing_pages, :path
  end
end
