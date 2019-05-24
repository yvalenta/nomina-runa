class CreateAsistencias < ActiveRecord::Migration[5.1]
  def change
    create_table :asistencias do |t|
      t.datetime :entrada
      t.datetime :salida
      t.references :user, foreign_key: true
      t.integer :counter, default: 0

      t.timestamps
    end
  end
end
