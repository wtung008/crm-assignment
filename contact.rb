class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts.each do |contact|
    puts "#{contact.first_name} #{contact.last_name}"
    end
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(contact_id)
      @@contacts.each do |contact|
        if contact_id == contact.id
          puts "#{contact.first_name} #{contact.last_name}"
        #else
        #  puts "Contact id #{contact_id} not found"
        end
      end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def self.update
    puts "Please provide id of contact you would like to update?"
    contact_id =gets.chomp
    puts "What attribute would you like to change [first_name, last_name, email, or note]?"
    contact_attr =gets.chomp
    puts "What is the new value?"
    new_value =gets.chomp
    @@contacts.each do |contact|
      if contact_id == contact.id
        index_value = @@contacts.index(contact_attr)
        @@contacts = @@contacts[index_value] = new_value  #not working :(
        #@@contacts[contact_attr] = new_value
      end
    end)
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by (attr_name, attr_value)
    @@contacts.each do |contact|
      if contact.attr_name == attr_value
        puts "#{contact.first_name} #{contact.last_name}"
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name (name)
    @@contacts.each do |contact|
      if contact.first_name == name
        puts "#{contact.first_name} #{contact.last_name}"
      end
    end
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete (name)
    @@contacts.each do |contact|
      contact.first_name = name
      @@contacts.delete(name)
  end

  # Feel free to add other methods here, if you need them.

end
