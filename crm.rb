require_relateive 'contact'


class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_a_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then enter_a_number
  end

  def add_new_contact
    print 'Enter First Name'
    first_name = gets.chomp

    print 'Enter Last Name'
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'Enter contact id for modification'
    contact_id =gets.chomp

    print 'Enter contact attribute to modify (first_name, last_name, email, or note)'
    attr_name =gets.chomp

    print 'Enter new value for the attribute'
    new_value =gets.chomp

    Contact.find(contact_id).update(attr_name, new_value)
  end

  def delete_contact
    print 'Enter contact id pertaining to contact to be deleted'
    contact_id =gets.chomp

    Contact.find(contact.id).delete
  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    print 'Enter attribute name to be searched (first_name, last_name, email, or note)'
    attr_name =gets.chomp

    print 'Enter attribute value'
    attr_value =gets.chomp

    Contact.find_by(attr_name, attr_value)
  end

end

#Input Data
a_crm_app = CRM.new
a_crm_app.main.main_menu
a_crm_app.print_main_menu
