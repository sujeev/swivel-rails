class UniqueNameValidator < ActiveModel::Validator
    def validate(record)
      if (Vertical.where(name: record.name).count > 0 )
        record.errors.add( :name, "Should be unique in verticals and categories")
      end
    end
  end