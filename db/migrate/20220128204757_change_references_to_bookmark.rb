class ChangeReferencesToBookmark < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookmarks, :movies, null: false, foreign_key: true
    remove_reference :bookmarks, :lists, null: false, foreign_key: true
    add_reference :bookmarks, :movie, foreign_key: true
    add_reference :bookmarks, :list, foreign_key: true

  end
end
