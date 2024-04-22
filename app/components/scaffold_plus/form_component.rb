class Pilot::FormComponent < ViewComponent::Base
  attr_accessor :form

  renders_many :fields, ->(method, type: :text_field, **options) do
    Pilot::FormFieldComponent.new(form: @form, method:, type:, **options)
  end

  renders_one :submit, ->(cancel_path:) do
    Pilot::FormSubmitComponent.new(form: @form, cancel_path: cancel_path)
  end


  def initialize(record:, namespace:)
    @record = record
    @namespace = namespace
    @model = @namespace.push(@record)
  end
end
