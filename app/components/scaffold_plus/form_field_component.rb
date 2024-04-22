class Pilot::FormFieldComponent < ViewComponent::Base
  def initialize(form:, method:, type: :text_field, **options)
    @form = form
    @method = method
    @type = type
    @options = options
    @label = @options.delete(:label)
    @options[:class] = "block w-full rounded border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-jade-600 sm:text-sm sm:leading-6 #{@options[:class]}"
    @options[:class] << " readonly" if @options[:readonly]
    @options[:class] << "ring-red-500" if @form.object.errors[@method].any?


    setup_custom_fields
  end

  def setup_custom_fields
    case @type
    when :select
      select_options
    when :enum
      enum_options
    when :reference
      reference_options
    end
  end

  def select_options
    @collection = @options.delete(:collection)
    @collection_options = @options.delete(:options) || { include_blank: true }
  end

  def enum_options
    @type = :select
    @collection = @form.object.class.defined_enums[@method.to_s].keys.map { |key| [ key.humanize, key ] }
    @collection_options = {}
  end

  def reference_options
    @type = :select
    @collection = @method.to_s.classify.constantize.all.map { |record| [ record.name, record.id ] }
    @collection_options = { include_blank: true }
    @method = @options.delete(:foreign_key) || "#{@method}_id"
  end
end
