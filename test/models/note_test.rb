require "test_helper"

class NoteTest < ActiveSupport::TestCase
  test "tag_names" do
    note = notes(:basic_note)
    note.tag_list = 'tag_a,tag_b';
    note.save!
    names = note.tags.pluck(:name)
    assert_equal ['tag_a', 'tag_b'], names.sort
  end
end
