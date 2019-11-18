%%%
title = "SACM Information Model"
abbrev = "sacm-infomodel"
ipr = "trust200902"
area = "Internet"
workgroup = "sacm"
submissiontype = "IETF"
keyword = [""]
date = 2019-07-25T00:00:00Z
docName = "draft-inacio-sacm-Infomodel-00"

[seriesInfo]
status = "standard"
name = "Internet Draft"
value = "draft-inacio-sacm-Infomodel-00"
stream = "IETF"

[[author]]
initials = "C."
surname = "Inacio"
fullname = "Christopher Inacio"
organization = "Carnegie Mellon University"
abbrev = "CMU"
	[author.address]
	email = "inacio@cert.org"
	[author.address.postal]
	street = "4500 5th Ave."
	city = "Pittsburgh"
	code = "PA 15213"
	country = "United States"
%%%


.# Abstract

This defines the information model for the Security Automation and
Continuous Monitoring (SACM) standards.  The working group faces a set of
complex issues when trying to define an information model that complicates
this effort:

* There are many standards in the SACM space which are not
  interoperable
* There exists an extremely large and diverse set of data types
  which are desirable to exchange
* Many data types depend on the operating systems from which they
  are collected; making a universal typing harder
* A goal of SACM is to cover a diverse set of system types
    
These complex needs create a information model which is difficult to unify
within the environment.  Instead, this information model design is focused
on minimum needed functionality with the desire to include a type system
design into the information model allowing for easy expandability.  It is
envisioned that this information model will serve the following purposes:

* Enough well specified elements in order to exchange key data
  fields between systems
* Sufficient typing system to expand key fields over time and use of
  a registry to standardize common expansions
* Meta information such that compplete information exchange using
  various other formats understood by all parties can be used as needed
  to exchange complete records on demand
* Sufficient action verbs defined to allow orchestration between various
  systems to allow unified control of federated components 


{mainmatter}

# Introduction

The set of elements which are desired to standarize are the subset of data elements used within the SACM standards and related standards.  To this end, the core capability to reasonably identify a network end point and minimally describe an event along with enough information that two parties involved in the communication may determine a way forward for further information exchange.  The minimal set of activity and endpoint identifiers will allow parties participating in SACM communications to effectively search their respecitive data stores for relevent and related information and respond to queries or accept events in kind.

This information model is intended to describe a minimal number of elements which enable this functionality, but also sufficiently describe the attributes which can define those elements.  This combination of information intends to provide enough meta information about information elements to allow both in protocol definition of types in possible data models as well as clear construction of future standardized element definitions.  Conversely, this information model is not attempting to define all possible information elements that need to be exchanged.  Many information elements, especially those related to host monitoring, are heavily related to the operating system and related software for proper context - beyond the initial scope of this standard.

##  Conventions and Terminology

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", 
"**SHOULD NOT**", "**RECOMMENDED**",  "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this
document are to be interpreted as described in BCP 14 [@!RFC2119][@!RFC8174] when, and only when, they appear
in all capitals, as shown here.

Additionally, the key words "**MIGHT**", "**COULD**", "**MAY WISH TO**", "**WOULD
PROBABLY**", "**SHOULD CONSIDER**", and "**MUST (BUT WE KNOW YOU WON'T)**" in
this document are to interpreted as described in RFC 6919 [@!RFC6919].


# Minimal Needed Information Elements

IP Address, hostname, time/date, SWID/CoSWID ID's, firmware versions, serial number, MAC address, certificate ID

# Information Element Metadata
name, basic_data_type, octet_length, data_use_type (label, counter, gauge), description, std/vendor type, structure/composite

The following fields are defined in the set of metadata about each information element

name: 
: A descriptive but concise name to be used for human understanding

basic data type:
: A fundamental data type supported by the this information model.  The predefined types include unsigned integers, signed integers, octet array, string, IP addresses, MAC addresses

octet length:
: The number of octets maximally used for this information

data use type:
: This refines the basic data type expressing the usage of the value.  For example, some integers represent mathematical values and may be added together (counts for example) while some things may be expressed as an integer, but are really a type of label (e.g. IP address)

description:
: A longer textual description of this data type

registration domain:
: The domain in which this information element is defined.

composite structure:
: The definition of the composite structure of following elements, e.g. list, set, map

## Information Elements

### IPv4 Address

Field                              | Value
-------------------------------|---------
Name                            | IPv4
Basic data type             | 32-bit unsigned integer
Octet length                  | 4
Data use type               | Label
Description                   | An Internet Protocol version 4 address
Registration domain     | standard
Composite structure     | N/A
Comments                    |



### IPv6 Address

Field                              | Value
-------------------------------|---------
Name                            | IPv6
Basic data type             | octet array
Octet length                  | 16
Data use type               | Label
Description                   | An Internet Protocol version 6 address
Registration domain     | standard
Composite structure     | N/A
Comments                    |

### Hostname

Field                              | Value
-------------------------------|---------
Name                            | Hostname
Basic data type             | string
Octet length                  | up to 256
Data use type               | Label
Description                   | Fully qualified domain name of endpoint system
Registration domain     | standard
Composite structure     | N/A
Comments                    |

### AssettID

Field                              | Value
-------------------------------|---------
Name                            | AssettID
Basic data type             | string
Octet length                  | up to 256
Data use type               | Label
Description                   | AssettID of topic assett
Registration domain     | standard
Composite structure     | N/A
Comments                    |

### MACAddress

Field                              | Value
-------------------------------|---------
Name                            | MACAddress
Basic data type             | string
Octet length                  | 6
Data use type               | Label
Description                   | IEEE 802 Hardware Address 
Registration domain     | standard
Composite structure     | N/A
Comments                    |


### Timestamp

Field                              | Value
-------------------------------|---------
Name                            | timestamp
Basic data type             |  ISO time formatted string
Octet length                  | variable
Data use type               | time/date
Description                   |  time date string
Registration domain     | standard
Composite structure     | N/A
Comments                    |


### Action


Field                              | Value
-------------------------------|---------
Name                            |  Action
Basic data type             |  enumeration
Octet length                  |  2
Data use type               |  label
Description                   | 
Registration domain     | standard
Composite structure     | 
Comments                    | RunAssessment, AssessmentResult, Subscribe, PubEvent, CapabilityDiscover

### Action Parameters


Field                              | Value
-------------------------------|---------
Name                            | Action Parameters
Basic data type             |  list
Octet length                  | variable
Data use type               | variable
Description                   | parameters for the action command, defined per action command
Registration domain     | standard
Composite structure     | list
Comments                    |


### OpaqueDataType


Field                              | Value
-------------------------------|---------
Name                            |  OpaquelDataType
Basic data type             | 16-bit integer
Octet length                  | 2
Data use type               | label
Description                   | An enumeration of registered additional data types that can be contained in the AdditionalData field
Registration domain     | standard
Composite structure     | N/A
Comments                    |

### OpaqueData

Field                              | Value
-------------------------------|---------
Name                            | OpaqueData
Basic data type             | octet-array
Octet length                  | variable
Data use type               | opaque
Description                   | This is an envelope to contain other standardized data exchange formats
Registration domain     | standard
Composite structure     | N/A
Comments                    | formats like OVAL or IF-MAP may be contained in here



### Extra

[ed: remove before publication]

Field                              | Value
-------------------------------|---------
Name                            | 
Basic data type             | 
Octet length                  | 
Data use type               | 
Description                   | 
Registration domain     | standard
Composite structure     | 
Comments                    |


# Updates

* 25-July-2019 - initial document

# IANA Considerations

This will create a IANA registery of elements, eventually.  IANA language to be added

# Security Considerations

To be completed.

{backmatter}


# Acknowledgements

The contributions of the SACM working group have greatly impacted the thinking presented here.  In particular, we wish to thank Bill Munyan, Adam Monteville, and Henk Birkholz.
