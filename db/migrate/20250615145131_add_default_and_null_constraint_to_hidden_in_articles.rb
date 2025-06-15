class AddDefaultAndNullConstraintToHiddenInArticles < ActiveRecord::Migration[7.2]
  def change
    change_column_default :articles, :hidden, from: nil, to: false
  end
end
