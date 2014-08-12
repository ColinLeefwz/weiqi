class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string   "title"
      t.string   "location"
      t.text     "expertise"
      t.text     "favorite_quote"
      t.text     "career"
      t.text     "education"
      t.string   "web_site"
      t.text     "article_reports"
      t.text     "additional"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "twitter"
      t.string   "country"
      t.string   "city"
    end
  end
end
