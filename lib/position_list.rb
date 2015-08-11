module PositionList
  class << self
    # FIXME слишком большая функция
    def list
      positions_structure = YAML.load_file("#{Rails.root}/lib/yaml/positions.yml").with_indifferent_access[:positions]
      exceptions = YAML.load_file("#{Rails.root}/lib/yaml/positions.yml").with_indifferent_access[:exceptions]
      non_existent = YAML.load_file("#{Rails.root}/lib/yaml/positions.yml").with_indifferent_access[:non_existent]
      positions_list = []
      positions_structure.keys.each do |branch|
        positions = positions_structure[branch]
        collection = branch.camelize.constantize.active
        # FIXME any idea?
        collection = collection.visible if branch.camelize.constantize == Team
        if positions.is_a? Array
          positions.each do |p|
            collection.each do |instance|
              full_name = "#{p.mb_chars.capitalize.to_s} #{instance.decorate.full_title(:genitive)}"
              unless non_existent.include? full_name
                full_name = exceptions[full_name] if exceptions[full_name]
                positions_list << full_name
              end
            end
          end
        elsif positions.is_a? Hash
          types = positions.keys
          types.each do |type|
            type_collection = type.camelize.constantize.active
            position_names = positions[type]
            position_names.each do |position_name|
              collection.each do |instance|
                type_collection.each do |type_instance|
                  full_name = "#{position_name.mb_chars.capitalize} #{type_instance.decorate.full_title(:genitive)} в #{instance.decorate.full_title(:dative)}"
                  unless non_existent.include? full_name
                    positions_list << full_name
                  end
                end
              end
            end
          end
        end
      end
      positions_list
    end
  end
end
