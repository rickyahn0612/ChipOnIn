class Volunteer < ActiveRecord::Base
	belongs_to :volunteerable, polymorphic: true
  def item_quantity_have
  	a = self.volunteerable
  	a.quantity_have
  end

  def item_quantity_given
    self.quantity_given
  end

  def item_quantity_needed
    a = self.volunteerable
    a.quantity_needed
  end

  def add_em_up
    item_quantity_given + item_quantity_have.to_i  
  end

  def subtract_em_down
    item_quantity_needed.to_i - item_quantity_given
  end

  def make_it_happen
  	a = self.volunteerable
    if item_quantity_have.to_i != item_quantity_needed.to_i
  	  a.update_attributes(quantity_have: add_em_up)
    else
      return false
    end
  end
end
