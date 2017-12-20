class S3BucketPublicReadWriteAclRule
  include BarkingIguana::CfLint::Rule

  def id
    'BARKINGIGUANA/S3/NO_PUBLIC_READ_WRITE_ACL'
  end

  def description
    'S3 buckets must not have a public read-write ACL'
  end

  def apply_to model
    identifiers = []

    model.resources_by_type('AWS::S3::Bucket').each do |bucket|
      next unless bucket.accessControl == 'PublicReadWrite'
      identifiers << bucket.logical_resource_id
    end

    identifiers
  end
end
