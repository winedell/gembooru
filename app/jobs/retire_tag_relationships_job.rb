class RetireTagRelationshipsJob < ApplicationJob
  def perform
    TagRelationshipRetirementService.find_and_retire!
  end
end
