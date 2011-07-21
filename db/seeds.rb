require 'active_record/fixtures'

Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "designers")
Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "portfolios")
Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "projects")
Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "comments")
