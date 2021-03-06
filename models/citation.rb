# private mongodb collection - not accessible directly through frontend
# used as a store for citation information, especially excerpts
class Citation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :document_id # e.g. the bill_id value
  field :document_type # e.g. "Bill"

  field :citation_id # e.g. usc/552/5

  # citations direct from unitedstates/citation, indexed by citation ID (e.g. usc.id)
  field :citations, type: Array

  index document_id: 1
  index document_type: 1
  index({document_id: 1, document_type: 1, citation_id: 1})
  index citation_id: 1
end