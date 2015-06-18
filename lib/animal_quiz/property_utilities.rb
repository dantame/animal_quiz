module PropertyUtilities
    def has_all_properties? *props
      props.all? do |prop|
        @properties.include?(prop)
      end
    end

    def has_any_properties? *props
      if props.length > 0
        props.any? do |prop|
          @properties.include?(prop)
        end
      end
    end
end
