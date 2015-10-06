module ApplicationHelper
  def address_to_form_fields( resource )
    resource.address.map do |key, val|
      "f.input '#{ key }', input_html: {value: '#{ val }' }"
    end
  end

  def address_to_table_data( resource )
    return resource.address.values.join(', ') if resource.address
  end

  class PlaceTablePresenter < Admino::Table::Presenter
    private

    def resource_row(resource, view_context)
      ResourceRow.new(resource, view_context)
      byebug
    end

    def head_row(collection_klass, query, view_context)
      HeadRow.new(collection_klass, query, view_context)
    end

    class ResourceRow < Admino::Table::ResourceRow
      private

      def action_html_options(action_name)
        { class: 'action-class' }
      end

      def show_action_html_options
        { class: 'show-action-class' }
      end

      def column_html_options(attribute_name)
        { class: 'column-class' }
      end
    end

    # class HeadRow < Admino::Table::ResourceRow
    #   def column_html_options(attribute_name)
    #     { class: 'column-class' }
    #   end
    # end
  end
end
