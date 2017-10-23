class CreateJoinTableSeoLandingPages < ActiveRecord::Migration[5.1]
  def change
    create_table :seo_landing_pages do |t|
      t.string :path
      t.timestamps
    end
    add_foreign_key :seo_landing_pages, :cities
    add_foreign_key :seo_landing_pages, :counties
    add_foreign_key :seo_landing_pages, :states
  end
end
