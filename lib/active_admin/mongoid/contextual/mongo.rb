module Mongoid
  module Contextual
    class Mongo
      def count(document = nil, &block)
        document = nil if document == true
        return super(&block) if block_given?
        return query.count unless document
        collection.find(criteria.and(_id: document.id).selector).count
      end
    end
  end
end
