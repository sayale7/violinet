module AssignModule
  
  def find_assign_ids
    params_hash = Hash.new
    params.each do |name, value|
      if name.to_s.include?('assign_id')
        params_hash = params_hash.merge({name.match(/\d+/)[0], value.to_s[5, value.to_s.size]})
      end
      if name.to_s.include?('user_assign_collection')
        value.each {|elem| params_hash = params_hash.merge({name.match(/\d+/)[0] << "_" << elem.to_s, elem.to_s}) } 
      end
    end
    return params_hash
  end
  
  def find_and_save_user_values(assignable_id)
    @params_hash.each {|key, value| 
      unless value.to_s.size == 0
        if key.to_s.include?('_')
          key = key.split("_").first
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_assignable_id_and_value_and_admin_assign_value_id(key,  assignable_id, AdminAssignValueName.find(value).name, AdminAssignValueName.find(value).admin_assign_value_id)
          user_assign_value.update_attribute(:value, AdminAssignValueName.find(value).name)
        else
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_assignable_id(key, assignable_id) 
          user_assign_value.update_attribute(:value, value)
        end
      end
    }
  end
  
end
