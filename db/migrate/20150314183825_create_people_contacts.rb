class CreatePeopleContacts < ActiveRecord::Migration
  def change
    create_table :people_contacts do |t|
      t.references :person, index: true
      t.references :contact, index: true
      
      t.text :notes

      t.timestamps null: false
    end
    add_foreign_key :people_contacts, :people
    add_foreign_key :people_contacts, :contacts
  end
end
