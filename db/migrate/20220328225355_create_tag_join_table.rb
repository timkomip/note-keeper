class CreateTagJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :notes, :tags do |t|
      # t.index [:note_id, :tag_id]
      t.index [:tag_id, :note_id], unique: true
    end
  end
end
