# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
def invalid_emails
  [
    'plainaddress', # Missing @ sign and domain
    '#@%^%#$@#$@#.com', # Garbage
    '@domain.com', # Missing username
    'Joe Smith <email@domain.com>', # Encoded html within email is invalid
    'email.domain.com', # Missing @
    'email@domain@domain.com', # Two @ sign
    'あいうえお@domain.com', # Unicode char as address
    'email@domain.com (Joe Smith)', #  Text followed email is not allowed
    'email@-domain.com', # Leading dash in front of domain is invalid
    'email@domain..com' # Multiple dot in the domain portion is invalid
  ]
end

def valid_emails
  [
    'email@domain.com', # Valid email
    'firstname.lastname@domain.com', # Email contains dot in the address field
    'email@subdomain.domain.com', # Email contains dot with subdomain
    'firstname+lastname@domain.com', # Plus sign is considered valid character
    'email@123.123.123.123', # Domain is valid IP address
    '1234567890@domain.com', # Digits in address are valid
    'email@domain-one.com', # Dash in domain name is valid
    '_______@domain.com', # Underscore in the address field is valid
    'email@domain.name', # .name is valid Top Level Domain name
    'email@domain.co.jp', # Dot in Top Level Domain name also considered valid (use co.jp as example here)
    'firstname-lastname@domain.com' # Dash in address field is valid
  ]
end
# rubocop:enable Metrics/MethodLength
