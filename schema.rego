package main

simple_schema := {
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "http://cyclonedx.org/schema/bom-1.6.schema.json",
  "type": "object",
  "title": "CycloneDX Bill of Materials Standard",
  "$comment" : "CycloneDX JSON schema is published under the terms of the Apache License 2.0.",
  "required": [
    "bomFormat",
    "specVersion"
  ],
  "additionalProperties": false,
  "properties": {
    "$schema": {
      "type": "string"
    },
    "bomFormat": {
      "type": "string",
      "title": "BOM Format",
      "description": "Specifies the format of the BOM. This helps to identify the file as CycloneDX since BOMs do not have a filename convention, nor does JSON schema support namespaces. This value MUST be \"CycloneDX\".",
      "enum": [
        "CycloneDX"
      ]
    },
    "specVersion": {
      "type": "string",
      "title": "CycloneDX Specification Version",
      "description": "The version of the CycloneDX specification the BOM conforms to.",
      "examples": ["1.6"]
    }
  }
}


cyclonedx_schema := {
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "http://cyclonedx.org/schema/bom-1.6.schema.json",
  "type": "object",
  "title": "CycloneDX Bill of Materials Standard",
  "$comment" : "CycloneDX JSON schema is published under the terms of the Apache License 2.0.",
  "required": [
    "bomFormat",
    "specVersion"
  ],
  "additionalProperties": false,
  "properties": {
    "$schema": {
      "type": "string"
    },
    "bomFormat": {
      "type": "string",
      "title": "BOM Format",
      "description": "Specifies the format of the BOM. This helps to identify the file as CycloneDX since BOMs do not have a filename convention, nor does JSON schema support namespaces. This value MUST be \"CycloneDX\".",
      "enum": [
        "CycloneDX"
      ]
    },
    "specVersion": {
      "type": "string",
      "title": "CycloneDX Specification Version",
      "description": "The version of the CycloneDX specification the BOM conforms to.",
      "examples": ["1.6"]
    },
    "serialNumber": {
      "type": "string",
      "title": "BOM Serial Number",
      "description": "Every BOM generated SHOULD have a unique serial number, even if the contents of the BOM have not changed over time. If specified, the serial number MUST conform to RFC-4122. Use of serial numbers is RECOMMENDED.",
      "examples": ["urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79"],
      "pattern": "^urn:uuid:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"
    },
    "version": {
      "type": "integer",
      "title": "BOM Version",
      "description": "Whenever an existing BOM is modified, either manually or through automated processes, the version of the BOM SHOULD be incremented by 1. When a system is presented with multiple BOMs with identical serial numbers, the system SHOULD use the most recent version of the BOM. The default version is '1'.",
      "minimum": 1,
      "default": 1,
      "examples": [1]
    },
    "metadata": {
      "$ref": "#/definitions/metadata",
      "title": "BOM Metadata",
      "description": "Provides additional information about a BOM."
    },
    "components": {
      "type": "array",
      "items": {"$ref": "#/definitions/component"},
      "uniqueItems": true,
      "title": "Components",
      "description": "A list of software and hardware components."
    },
    "services": {
      "type": "array",
      "items": {"$ref": "#/definitions/service"},
      "uniqueItems": true,
      "title": "Services",
      "description": "A list of services. This may include microservices, function-as-a-service, and other types of network or intra-process services."
    },
    "externalReferences": {
      "type": "array",
      "items": {"$ref": "#/definitions/externalReference"},
      "title": "External References",
      "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
    },
    "dependencies": {
      "type": "array",
      "items": {"$ref": "#/definitions/dependency"},
      "uniqueItems": true,
      "title": "Dependencies",
      "description": "Provides the ability to document dependency relationships including provided & implemented components."
    },
    "compositions": {
      "type": "array",
      "items": {"$ref": "#/definitions/compositions"},
      "uniqueItems": true,
      "title": "Compositions",
      "description": "Compositions describe constituent parts (including components, services, and dependency relationships) and their completeness. The completeness of vulnerabilities expressed in a BOM may also be described."
    },
    "vulnerabilities": {
      "type": "array",
      "items": {"$ref": "#/definitions/vulnerability"},
      "uniqueItems": true,
      "title": "Vulnerabilities",
      "description": "Vulnerabilities identified in components or services."
    },
    "annotations": {
      "type": "array",
      "items": {"$ref": "#/definitions/annotations"},
      "uniqueItems": true,
      "title": "Annotations",
      "description": "Comments made by people, organizations, or tools about any object with a bom-ref, such as components, services, vulnerabilities, or the BOM itself. Unlike inventory information, annotations may contain opinions or commentary from various stakeholders. Annotations may be inline (with inventory) or externalized via BOM-Link and may optionally be signed."
    },
    "formulation": {
      "type": "array",
      "items": {"$ref": "#/definitions/formula"},
      "uniqueItems": true,
      "title": "Formulation",
      "description": "Describes how a component or service was manufactured or deployed. This is achieved through the use of formulas, workflows, tasks, and steps, which declare the precise steps to reproduce along with the observed formulas describing the steps which transpired in the manufacturing process."
    },
    "declarations": {
      "type": "object",
      "title": "Declarations",
      "description": "The list of declarations which describe the conformance to standards. Each declaration may include attestations, claims, and evidence.",
      "additionalProperties": false,
      "properties": {
        "assessors": {
          "type": "array",
          "title": "Assessors",
          "description": "The list of assessors evaluating claims and determining conformance to requirements and confidence in that assessment.",
          "items": {
            "type": "object",
            "title": "Assessor",
            "description": "The assessor who evaluates claims and determines conformance to requirements and confidence in that assessment.",
            "additionalProperties": false,
            "properties": {
              "bom-ref": {
                "$ref": "#/definitions/refType",
                "title": "BOM Reference",
                "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM."
              },
              "thirdParty": {
                "type": "boolean",
                "title": "Third Party",
                "description": "The boolean indicating if the assessor is outside the organization generating claims. A value of false indicates a self assessor."
              },
              "organization": {
                "$ref": "#/definitions/organizationalEntity",
                "title": "Organization",
                "description": "The entity issuing the assessment."
              }
            }
          }
        },
        "attestations": {
          "type": "array",
          "title": "Attestations",
          "description": "The list of attestations asserted by an assessor that maps requirements to claims.",
          "items": {
            "type": "object",
            "title": "Attestation",
            "additionalProperties": false,
            "properties": {
              "summary":  {
                "type": "string",
                "title": "Summary",
                "description": "The short description explaining the main points of the attestation."
              },
              "assessor": {
                "$ref": "#/definitions/refLinkType",
                "title": "Assessor",
                "description": "The `bom-ref` to the assessor asserting the attestation."
              },
              "map": {
                "type": "array",
                "title": "Map",
                "description": "The grouping of requirements to claims and the attestors declared conformance and confidence thereof.",
                "items": {
                  "type": "object",
                  "title": "Map",
                  "additionalProperties": false,
                  "properties": {
                    "requirement": {
                      "$ref": "#/definitions/refLinkType",
                      "title": "Requirement",
                      "description": "The `bom-ref` to the requirement being attested to."
                    },
                    "claims": {
                      "type": "array",
                      "title": "Claims",
                      "description": "The list of `bom-ref` to the claims being attested to.",
                      "items": { "$ref": "#/definitions/refLinkType" }
                    },
                    "counterClaims": {
                      "type": "array",
                      "title": "Counter Claims",
                      "description": "The list of  `bom-ref` to the counter claims being attested to.",
                      "items": { "$ref": "#/definitions/refLinkType" }
                    },
                    "conformance": {
                      "type": "object",
                      "title": "Conformance",
                      "description": "The conformance of the claim meeting a requirement.",
                      "additionalProperties": false,
                      "properties": {
                        "score": {
                          "type": "number",
                          "minimum": 0,
                          "maximum": 1,
                          "title": "Score",
                          "description": "The conformance of the claim between and inclusive of 0 and 1, where 1 is 100% conformance."
                        },
                        "rationale": {
                          "type": "string",
                          "title": "Rationale",
                          "description": "The rationale for the conformance score."
                        },
                        "mitigationStrategies": {
                          "type": "array",
                          "title": "Mitigation Strategies",
                          "description": "The list of  `bom-ref` to the evidence provided describing the mitigation strategies.",
                          "items": { "$ref": "#/definitions/refLinkType" }
                        }
                      }
                    },
                    "confidence": {
                      "type": "object",
                      "title": "Confidence",
                      "description": "The confidence of the claim meeting the requirement.",
                      "additionalProperties": false,
                      "properties": {
                        "score": {
                          "type": "number",
                          "minimum": 0,
                          "maximum": 1,
                          "title": "Score",
                          "description": "The confidence of the claim between and inclusive of 0 and 1, where 1 is 100% confidence."
                        },
                        "rationale": {
                          "type": "string",
                          "title": "Rationale",
                          "description": "The rationale for the confidence score."
                        }
                      }
                    }
                  }
                }
              },
              "signature": {
                "$ref": "#/definitions/signature",
                "title": "Signature",
                "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
              }
            }
          }
        },
        "claims": {
          "type": "array",
          "title": "Claims",
          "description": "The list of claims.",
          "items": {
            "type": "object",
            "title": "Claim",
            "additionalProperties": false,
            "properties": {
              "bom-ref": {
                "$ref": "#/definitions/refType",
                "title": "BOM Reference",
                "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM."
              },
              "target": {
                "$ref": "#/definitions/refLinkType",
                "title": "Target",
                "description": "The `bom-ref` to a target representing a specific system, application, API, module, team, person, process, business unit, company, etc...  that this claim is being applied to."
              },
              "predicate": {
                "type": "string",
                "title": "Predicate",
                "description": "The specific statement or assertion about the target."
              },
              "mitigationStrategies": {
                "type": "array",
                "title": "Mitigation Strategies",
                "description": "The list of  `bom-ref` to the evidence provided describing the mitigation strategies. Each mitigation strategy should include an explanation of how any weaknesses in the evidence will be mitigated.",
                "items": { "$ref": "#/definitions/refLinkType" }
              },
              "reasoning": {
                "type": "string",
                "title": "Reasoning",
                "description": "The written explanation of why the evidence provided substantiates the claim."
              },
              "evidence": {
                "type": "array",
                "title": "Evidence",
                "description": "The list of `bom-ref` to evidence that supports this claim.",
                "items": { "$ref": "#/definitions/refLinkType" }
              },
              "counterEvidence": {
                "type": "array",
                "title": "Counter Evidence",
                "description": "The list of `bom-ref` to counterEvidence that supports this claim.",
                "items": { "$ref": "#/definitions/refLinkType" }
              },
              "externalReferences": {
                "type": "array",
                "items": {"$ref": "#/definitions/externalReference"},
                "title": "External References",
                "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
              },
              "signature": {
                "$ref": "#/definitions/signature",
                "title": "Signature",
                "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
              }
            }
          }
        },
        "evidence": {
          "type": "array",
          "title": "Evidence",
          "description": "The list of evidence",
          "items": {
            "type": "object",
            "title": "Evidence",
            "additionalProperties": false,
            "properties": {
              "bom-ref": {
                "$ref": "#/definitions/refType",
                "title": "BOM Reference",
                "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM."
              },
              "propertyName": {
                "type": "string",
                "title": "Property Name",
                "description": "The reference to the property name as defined in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy/)."
              },
              "description": {
                "type": "string",
                "title": "Description",
                "description": "The written description of what this evidence is and how it was created."
              },
              "data": {
                "type": "array",
                "title": "Data",
                "description": "The output or analysis that supports claims.",
                "items": {
                  "type": "object",
                  "title": "Data",
                  "additionalProperties": false,
                  "properties": {
                    "name": {
                      "title": "Data Name",
                      "description": "The name of the data.",
                      "type": "string"
                    },
                    "contents": {
                      "type": "object",
                      "title": "Data Contents",
                      "description": "The contents or references to the contents of the data being described.",
                      "additionalProperties": false,
                      "properties": {
                        "attachment": {
                          "title": "Data Attachment",
                          "description": "An optional way to include textual or encoded data.",
                          "$ref": "#/definitions/attachment"
                        },
                        "url": {
                          "type": "string",
                          "title": "Data URL",
                          "description": "The URL to where the data can be retrieved.",
                          "format": "iri-reference"
                        }
                      }
                    },
                    "classification": {
                      "$ref": "#/definitions/dataClassification"
                    },
                    "sensitiveData": {
                      "type": "array",
                      "title": "Sensitive Data",
                      "description": "A description of any sensitive data included.",
                      "items": {
                        "type": "string"
                      }
                    },
                    "governance": {
                      "title": "Data Governance",
                      "$ref": "#/definitions/dataGovernance"
                    }
                  }
                }
              },
              "created": {
                "type": "string",
                "format": "date-time",
                "title": "Created",
                "description": "The date and time (timestamp) when the evidence was created."
              },
              "expires": {
                "type": "string",
                "format": "date-time",
                "title": "Expires",
                "description": "The optional date and time (timestamp) when the evidence is no longer valid."
              },
              "author": {
                "$ref": "#/definitions/organizationalContact",
                "title": "Author",
                "description": "The author of the evidence."
              },
              "reviewer": {
                "$ref": "#/definitions/organizationalContact",
                "title": "Reviewer",
                "description": "The reviewer of the evidence."
              },
              "signature": {
                "$ref": "#/definitions/signature",
                "title": "Signature",
                "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
              }
            }
          }
        },
        "targets": {
          "type": "object",
          "title": "Targets",
          "description": "The list of targets which claims are made against.",
          "additionalProperties": false,
          "properties": {
            "organizations": {
              "type": "array",
              "title": "Organizations",
              "description": "The list of organizations which claims are made against.",
              "items": {"$ref": "#/definitions/organizationalEntity"}
            },
            "components": {
              "type": "array",
              "title": "Components",
              "description": "The list of components which claims are made against.",
              "items": {"$ref": "#/definitions/component"}
            },
            "services": {
              "type": "array",
              "title": "Services",
              "description": "The list of services which claims are made against.",
              "items": {"$ref": "#/definitions/service"}
            }
          }
        },
        "affirmation": {
          "type": "object",
          "title": "Affirmation",
          "additionalProperties": false,
          "properties": {
            "statement": {
              "type": "string",
              "title": "Statement",
              "description": "The brief statement affirmed by an individual regarding all declarations.\n*- Notes This could be an affirmation of acceptance by a third-party auditor or receiving individual of a file.",
              "examples": [ "I certify, to the best of my knowledge, that all information is correct." ]
            },
            "signatories": {
              "type": "array",
              "title": "Signatories",
              "description": "The list of signatories authorized on behalf of an organization to assert validity of this document.",
              "items": {
                "type": "object",
                "title": "Signatory",
                "additionalProperties": false,
                "oneOf": [
                  {
                    "required": ["signature"]
                  },
                  {
                    "required": ["externalReference", "organization"]
                  }
                ],
                "properties": {
                  "name": {
                    "type": "string",
                    "title": "Name",
                    "description": "The signatory's name."
                  },
                  "role": {
                    "type": "string",
                    "title": "Role",
                    "description": "The signatory's role within an organization."
                  },
                  "signature": {
                    "$ref": "#/definitions/signature",
                    "title": "Signature",
                    "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
                  },
                  "organization": {
                    "$ref": "#/definitions/organizationalEntity",
                    "title": "Organization",
                    "description": "The signatory's organization."
                  },
                  "externalReference": {
                    "$ref": "#/definitions/externalReference",
                    "title": "External Reference",
                    "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
                  }
                }
              }
            },
            "signature": {
              "$ref": "#/definitions/signature",
              "title": "Signature",
              "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
            }
          }
        },
        "signature": {
          "$ref": "#/definitions/signature",
          "title": "Signature",
          "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
        }
      }
    },
    "definitions": {
      "type": "object",
      "title": "Definitions",
      "description": "A collection of reusable objects that are defined and may be used elsewhere in the BOM.",
      "additionalProperties": false,
      "properties": {
        "standards": {
          "type": "array",
          "title": "Standards",
          "description": "The list of standards which may consist of regulations, industry or organizational-specific standards, maturity models, best practices, or any other requirements which can be evaluated against or attested to.",
          "items": {
            "$ref": "#/definitions/standard"
          }
        }
      }
    },
    "properties": {
      "type": "array",
      "title": "Properties",
      "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
      "items": {
        "$ref": "#/definitions/property"
      }
    },
    "signature": {
      "$ref": "#/definitions/signature",
      "title": "Signature",
      "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
    }
  },
  "definitions": {
    "refType": {
      "description": "Identifier for referable and therefore interlinkable elements.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
      "type": "string",
      "minLength": 1,
      "$comment": "TODO (breaking change): add a format constraint that prevents the value from staring with 'urn:cdx:'"
    },
    "refLinkType": {
      "description": "Descriptor for an element identified by the attribute 'bom-ref' in the same BOM document.\nIn contrast to `bomLinkElementType`.",
      "$ref": "#/definitions/refType"
    },
    "bomLinkDocumentType": {
      "title": "BOM-Link Document",
      "description": "Descriptor for another BOM document. See https://cyclonedx.org/capabilities/bomlink/",
      "type": "string",
      "format": "iri-reference",
      "pattern": "^urn:cdx:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/[1-9][0-9]*$",
      "$comment": "part of the pattern is based on `bom.serialNumber`'s pattern"
    },
    "bomLinkElementType": {
      "title": "BOM-Link Element",
      "description": "Descriptor for an element in a BOM document. See https://cyclonedx.org/capabilities/bomlink/",
      "type": "string",
      "format": "iri-reference",
      "pattern": "^urn:cdx:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/[1-9][0-9]*#.+$",
      "$comment": "part of the pattern is based on `bom.serialNumber`'s pattern"
    },
    "bomLink": {
      "title": "BOM-Link",
      "anyOf": [
        {
          "title": "BOM-Link Document",
          "$ref": "#/definitions/bomLinkDocumentType"
        },
        {
          "title": "BOM-Link Element",
          "$ref": "#/definitions/bomLinkElementType"
        }
      ]
    },
    "metadata": {
      "type": "object",
      "title": "BOM Metadata",
      "additionalProperties": false,
      "properties": {
        "timestamp": {
          "type": "string",
          "format": "date-time",
          "title": "Timestamp",
          "description": "The date and time (timestamp) when the BOM was created."
        },
        "lifecycles": {
          "type": "array",
          "title": "Lifecycles",
          "description": "Lifecycles communicate the stage(s) in which data in the BOM was captured. Different types of data may be available at various phases of a lifecycle, such as the Software Development Lifecycle (SDLC), IT Asset Management (ITAM), and Software Asset Management (SAM). Thus, a BOM may include data specific to or only obtainable in a given lifecycle.",
          "items": {
            "type": "object",
            "title": "Lifecycle",
            "description": "The product lifecycle(s) that this BOM represents.",
            "oneOf": [
              {
                "title": "Pre-Defined Phase",
                "required": ["phase"],
                "additionalProperties": false,
                "properties": {
                  "phase": {
                    "type": "string",
                    "title": "Phase",
                    "description": "A pre-defined phase in the product lifecycle.",
                    "enum": [
                      "design",
                      "pre-build",
                      "build",
                      "post-build",
                      "operations",
                      "discovery",
                      "decommission"
                    ],
                    "meta:enum": {
                      "design": "BOM produced early in the development lifecycle containing an inventory of components and services that are proposed or planned to be used. The inventory may need to be procured, retrieved, or resourced prior to use.",
                      "pre-build": "BOM consisting of information obtained prior to a build process and may contain source files and development artifacts and manifests. The inventory may need to be resolved and retrieved prior to use.",
                      "build": "BOM consisting of information obtained during a build process where component inventory is available for use. The precise versions of resolved components are usually available at this time as well as the provenance of where the components were retrieved from.",
                      "post-build": "BOM consisting of information obtained after a build process has completed and the resulting components(s) are available for further analysis. Built components may exist as the result of a CI/CD process, may have been installed or deployed to a system or device, and may need to be retrieved or extracted from the system or device.",
                      "operations": "BOM produced that represents inventory that is running and operational. This may include staging or production environments and will generally encompass multiple SBOMs describing the applications and operating system, along with HBOMs describing the hardware that makes up the system. Operations Bill of Materials (OBOM) can provide full-stack inventory of runtime environments, configurations, and additional dependencies.",
                      "discovery": "BOM consisting of information observed through network discovery providing point-in-time enumeration of embedded, on-premise, and cloud-native services such as server applications, connected devices, microservices, and serverless functions.",
                      "decommission": "BOM containing inventory that will be, or has been retired from operations."
                    }
                  }
                }
              },
              {
                "title": "Custom Phase",
                "required": ["name"],
                "additionalProperties": false,
                "properties": {
                  "name": {
                    "type": "string",
                    "title": "Name",
                    "description": "The name of the lifecycle phase"
                  },
                  "description": {
                    "type": "string",
                    "title": "Description",
                    "description": "The description of the lifecycle phase"
                  }
                }
              }
            ]
          }
      },
        "tools": {
          "title": "Tools",
          "description": "The tool(s) used in the creation, enrichment, and validation of the BOM.",
          "oneOf": [
            {
              "type": "object",
              "title": "Tools",
              "description": "The tool(s) used in the creation, enrichment, and validation of the BOM.",
              "additionalProperties": false,
              "properties": {
                "components": {
                  "type": "array",
                  "items": {"$ref": "#/definitions/component"},
                  "uniqueItems": true,
                  "title": "Components",
                  "description": "A list of software and hardware components used as tools."
                },
                "services": {
                  "type": "array",
                  "items": {"$ref": "#/definitions/service"},
                  "uniqueItems": true,
                  "title": "Services",
                  "description": "A list of services used as tools. This may include microservices, function-as-a-service, and other types of network or intra-process services."
                }
              }
            },
            {
              "type": "array",
              "title": "Tools (legacy)",
              "description": "[Deprecated] The tool(s) used in the creation, enrichment, and validation of the BOM.",
              "items": {"$ref": "#/definitions/tool"}
            }
          ]
        },
        "manufacturer": {
          "title": "BOM Manufacturer",
          "description": "The organization that created the BOM.\nManufacturer is common in BOMs created through automated processes. BOMs created through manual means may have `@.authors` instead.",
          "$ref": "#/definitions/organizationalEntity"
        },
        "authors": {
          "type": "array",
          "title": "BOM Authors",
          "description": "The person(s) who created the BOM.\nAuthors are common in BOMs created through manual processes. BOMs created through automated means may have `@.manufacturer` instead.",
          "items": {"$ref": "#/definitions/organizationalContact"}
        },
        "component": {
          "title": "Component",
          "description": "The component that the BOM describes.",
          "$ref": "#/definitions/component"
        },
        "manufacture": {
          "deprecated": true,
          "title": "Component Manufacture (legacy)",
          "description": "[Deprecated] This will be removed in a future version. Use the `@.component.manufacturer` instead.\nThe organization that manufactured the component that the BOM describes.",
          "$ref": "#/definitions/organizationalEntity"
        },
        "supplier": {
          "title": "Supplier",
          "description": " The organization that supplied the component that the BOM describes. The supplier may often be the manufacturer, but may also be a distributor or repackager.",
          "$ref": "#/definitions/organizationalEntity"
        },
        "licenses": {
          "title": "BOM License(s)",
          "description": "The license information for the BOM document.\nThis may be different from the license(s) of the component(s) that the BOM describes.",
          "$ref": "#/definitions/licenseChoice"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
          "items": {"$ref": "#/definitions/property"}
        }
      }
    },
    "tool": {
      "type": "object",
      "title": "Tool",
      "description": "[Deprecated] This will be removed in a future version. Use component or service instead. Information about the automated or manual tool used",
      "additionalProperties": false,
      "properties": {
        "vendor": {
          "type": "string",
          "title": "Tool Vendor",
          "description": "The name of the vendor who created the tool"
        },
        "name": {
          "type": "string",
          "title": "Tool Name",
          "description": "The name of the tool"
        },
        "version": {
          "$ref": "#/definitions/version",
          "title": "Tool Version",
          "description": "The version of the tool"
        },
        "hashes": {
          "type": "array",
          "items": {"$ref": "#/definitions/hash"},
          "title": "Hashes",
          "description": "The hashes of the tool (if applicable)."
        },
        "externalReferences": {
          "type": "array",
          "items": {"$ref": "#/definitions/externalReference"},
          "title": "External References",
          "description": "External references provide a way to document systems, sites, and information that may be relevant, but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
        }
      }
    },
    "organizationalEntity": {
      "type": "object",
      "title": "Organizational Entity",
      "description": "",
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "name": {
          "type": "string",
          "title": "Organization Name",
          "description": "The name of the organization",
          "examples": [
            "Example Inc."
          ]
        },
        "address": {
          "$ref": "#/definitions/postalAddress",
          "title": "Organization Address",
          "description": "The physical address (location) of the organization"
        },
        "url": {
          "type": "array",
          "items": {
            "type": "string",
            "format": "iri-reference"
          },
          "title": "Organization URL(s)",
          "description": "The URL of the organization. Multiple URLs are allowed.",
          "examples": ["https://example.com"]
        },
        "contact": {
          "type": "array",
          "title": "Organizational Contact",
          "description": "A contact at the organization. Multiple contacts are allowed.",
          "items": {"$ref": "#/definitions/organizationalContact"}
        }
      }
    },
    "organizationalContact": {
      "type": "object",
      "title": "Organizational Contact",
      "description": "",
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "name": {
          "type": "string",
          "title": "Name",
          "description": "The name of a contact",
          "examples": ["Contact name"]
        },
        "email": {
          "type": "string",
          "format": "idn-email",
          "title": "Email Address",
          "description": "The email address of the contact.",
          "examples": ["firstname.lastname@example.com"]
        },
        "phone": {
          "type": "string",
          "title": "Phone",
          "description": "The phone number of the contact.",
          "examples": ["800-555-1212"]
        }
      }
    },
    "component": {
      "type": "object",
      "title": "Component",
      "required": [
        "type",
        "name"
      ],
      "additionalProperties": false,
      "properties": {
        "type": {
          "type": "string",
          "enum": [
            "application",
            "framework",
            "library",
            "container",
            "platform",
            "operating-system",
            "device",
            "device-driver",
            "firmware",
            "file",
            "machine-learning-model",
            "data",
            "cryptographic-asset"
          ],
          "meta:enum": {
            "application": "A software application. Refer to [https://en.wikipedia.org/wiki/Application_software](https://en.wikipedia.org/wiki/Application_software) for information about applications.",
            "framework": "A software framework. Refer to [https://en.wikipedia.org/wiki/Software_framework](https://en.wikipedia.org/wiki/Software_framework) for information on how frameworks vary slightly from libraries.",
            "library": "A software library. Refer to [https://en.wikipedia.org/wiki/Library_(computing)](https://en.wikipedia.org/wiki/Library_(computing)) for information about libraries. All third-party and open source reusable components will likely be a library. If the library also has key features of a framework, then it should be classified as a framework. If not, or is unknown, then specifying library is RECOMMENDED.",
            "container": "A packaging and/or runtime format, not specific to any particular technology, which isolates software inside the container from software outside of a container through virtualization technology. Refer to [https://en.wikipedia.org/wiki/OS-level_virtualization](https://en.wikipedia.org/wiki/OS-level_virtualization).",
            "platform": "A runtime environment which interprets or executes software. This may include runtimes such as those that execute bytecode or low-code/no-code application platforms.",
            "operating-system": "A software operating system without regard to deployment model (i.e. installed on physical hardware, virtual machine, image, etc) Refer to [https://en.wikipedia.org/wiki/Operating_system](https://en.wikipedia.org/wiki/Operating_system).",
            "device": "A hardware device such as a processor or chip-set. A hardware device containing firmware SHOULD include a component for the physical hardware itself and another component of type 'firmware' or 'operating-system' (whichever is relevant), describing information about the software running on the device. See also the list of [known device properties](https://github.com/CycloneDX/cyclonedx-property-taxonomy/blob/main/cdx/device.md).",
            "device-driver": "A special type of software that operates or controls a particular type of device. Refer to [https://en.wikipedia.org/wiki/Device_driver](https://en.wikipedia.org/wiki/Device_driver).",
            "firmware": "A special type of software that provides low-level control over a device's hardware. Refer to [https://en.wikipedia.org/wiki/Firmware](https://en.wikipedia.org/wiki/Firmware).",
            "file": "A computer file. Refer to [https://en.wikipedia.org/wiki/Computer_file](https://en.wikipedia.org/wiki/Computer_file) for information about files.",
            "machine-learning-model": "A model based on training data that can make predictions or decisions without being explicitly programmed to do so.",
            "data": "A collection of discrete values that convey information.",
            "cryptographic-asset": "A cryptographic asset including algorithms, protocols, certificates, keys, tokens, and secrets."
          },
          "title": "Component Type",
          "description": "Specifies the type of component. For software components, classify as application if no more specific appropriate classification is available or cannot be determined for the component.",
          "examples": ["library"]
        },
        "mime-type": {
          "type": "string",
          "title": "Mime-Type",
          "description": "The optional mime-type of the component. When used on file components, the mime-type can provide additional context about the kind of file being represented, such as an image, font, or executable. Some library or framework components may also have an associated mime-type.",
          "examples": ["image/jpeg"],
          "pattern": "^[-+a-z0-9.]+/[-+a-z0-9.]+$"
        },
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the component elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "supplier": {
          "title": "Component Supplier",
          "description": " The organization that supplied the component. The supplier may often be the manufacturer, but may also be a distributor or repackager.",
          "$ref": "#/definitions/organizationalEntity"
        },
        "manufacturer": {
          "title": "Component Manufacturer",
          "description": "The organization that created the component.\nManufacturer is common in components created through automated processes. Components created through manual means may have `@.authors` instead.",
          "$ref": "#/definitions/organizationalEntity"
        },
        "authors" :{
          "type": "array",
          "title": "Component Authors",
          "description": "The person(s) who created the component.\nAuthors are common in components created through manual processes. Components created through automated means may have `@.manufacturer` instead.",
          "items": {"$ref": "#/definitions/organizationalContact"}
        },
        "author": {
          "deprecated": true,
          "type": "string",
          "title": "Component Author (legacy)",
          "description": "[Deprecated] This will be removed in a future version. Use `@.authors` or `@.manufacturer` instead.\nThe person(s) or organization(s) that authored the component",
          "examples": ["Acme Inc"]
        },
        "publisher": {
          "type": "string",
          "title": "Component Publisher",
          "description": "The person(s) or organization(s) that published the component",
          "examples": ["Acme Inc"]
        },
        "group": {
          "type": "string",
          "title": "Component Group",
          "description": "The grouping name or identifier. This will often be a shortened, single name of the company or project that produced the component, or the source package or domain name. Whitespace and special characters should be avoided. Examples include: apache, org.apache.commons, and apache.org.",
          "examples": ["com.acme"]
        },
        "name": {
          "type": "string",
          "title": "Component Name",
          "description": "The name of the component. This will often be a shortened, single name of the component. Examples: commons-lang3 and jquery",
          "examples": ["tomcat-catalina"]
        },
        "version": {
          "$ref": "#/definitions/version",
          "title": "Component Version",
          "description": "The component version. The version should ideally comply with semantic versioning but is not enforced."
        },
        "description": {
          "type": "string",
          "title": "Component Description",
          "description": "Specifies a description for the component"
        },
        "scope": {
          "type": "string",
          "enum": [
            "required",
            "optional",
            "excluded"
          ],
          "meta:enum": {
            "required": "The component is required for runtime",
            "optional": "The component is optional at runtime. Optional components are components that are not capable of being called due to them not being installed or otherwise accessible by any means. Components that are installed but due to configuration or other restrictions are prohibited from being called must be scoped as 'required'.",
            "excluded": "Components that are excluded provide the ability to document component usage for test and other non-runtime purposes. Excluded components are not reachable within a call graph at runtime."
          },
          "title": "Component Scope",
          "description": "Specifies the scope of the component. If scope is not specified, 'required' scope SHOULD be assumed by the consumer of the BOM.",
          "default": "required"
        },
        "hashes": {
          "type": "array",
          "title": "Component Hashes",
          "description": "The hashes of the component.",
          "items": {"$ref": "#/definitions/hash"}
        },
        "licenses": {
          "$ref": "#/definitions/licenseChoice",
          "title": "Component License(s)"
        },
        "copyright": {
          "type": "string",
          "title": "Component Copyright",
          "description": "A copyright notice informing users of the underlying claims to copyright ownership in a published work.",
          "examples": ["Acme Inc"]
        },
        "cpe": {
          "type": "string",
          "title": "Common Platform Enumeration (CPE)",
          "description": "Asserts the identity of the component using CPE. The CPE must conform to the CPE 2.2 or 2.3 specification. See [https://nvd.nist.gov/products/cpe](https://nvd.nist.gov/products/cpe). Refer to `@.evidence.identity` to optionally provide evidence that substantiates the assertion of the component's identity.",
          "examples": ["cpe:2.3:a:acme:component_framework:-:*:*:*:*:*:*:*"]
        },
        "purl": {
          "type": "string",
          "title": "Package URL (purl)",
          "description": "Asserts the identity of the component using package-url (purl). The purl, if specified, MUST be valid and conform to the specification defined at: [https://github.com/package-url/purl-spec](https://github.com/package-url/purl-spec). Refer to `@.evidence.identity` to optionally provide evidence that substantiates the assertion of the component's identity.",
          "examples": ["pkg:maven/com.acme/tomcat-catalina@9.0.14?packaging=jar"]
        },
        "omniborId": {
          "type": "array",
          "title": "OmniBOR Artifact Identifier (gitoid)",
          "description": "Asserts the identity of the component using the OmniBOR Artifact ID. The OmniBOR, if specified, MUST be valid and conform to the specification defined at: [https://www.iana.org/assignments/uri-schemes/prov/gitoid](https://www.iana.org/assignments/uri-schemes/prov/gitoid). Refer to `@.evidence.identity` to optionally provide evidence that substantiates the assertion of the component's identity.",
          "items": { "type": "string" },
          "examples": [
            "gitoid:blob:sha1:a94a8fe5ccb19ba61c4c0873d391e987982fbbd3",
            "gitoid:blob:sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"
          ]
        },
        "swhid": {
          "type": "array",
          "title": "SoftWare Heritage Identifier",
          "description": "Asserts the identity of the component using the Software Heritage persistent identifier (SWHID). The SWHID, if specified, MUST be valid and conform to the specification defined at: [https://docs.softwareheritage.org/devel/swh-model/persistent-identifiers.html](https://docs.softwareheritage.org/devel/swh-model/persistent-identifiers.html). Refer to `@.evidence.identity` to optionally provide evidence that substantiates the assertion of the component's identity.",
          "items": { "type": "string" },
          "examples": ["swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2"]
        },
        "swid": {
          "$ref": "#/definitions/swid",
          "title": "SWID Tag",
          "description": "Asserts the identity of the component using [ISO-IEC 19770-2 Software Identification (SWID) Tags](https://www.iso.org/standard/65666.html). Refer to `@.evidence.identity` to optionally provide evidence that substantiates the assertion of the component's identity."
        },
        "modified": {
          "type": "boolean",
          "title": "Component Modified From Original",
          "description": "[Deprecated] This will be removed in a future version. Use the pedigree element instead to supply information on exactly how the component was modified. A boolean value indicating if the component has been modified from the original. A value of true indicates the component is a derivative of the original. A value of false indicates the component has not been modified from the original."
        },
        "pedigree": {
          "type": "object",
          "title": "Component Pedigree",
          "description": "Component pedigree is a way to document complex supply chain scenarios where components are created, distributed, modified, redistributed, combined with other components, etc. Pedigree supports viewing this complex chain from the beginning, the end, or anywhere in the middle. It also provides a way to document variants where the exact relation may not be known.",
          "additionalProperties": false,
          "properties": {
            "ancestors": {
              "type": "array",
              "title": "Ancestors",
              "description": "Describes zero or more components in which a component is derived from. This is commonly used to describe forks from existing projects where the forked version contains a ancestor node containing the original component it was forked from. For example, Component A is the original component. Component B is the component being used and documented in the BOM. However, Component B contains a pedigree node with a single ancestor documenting Component A - the original component from which Component B is derived from.",
              "items": {"$ref": "#/definitions/component"}
            },
            "descendants": {
              "type": "array",
              "title": "Descendants",
              "description": "Descendants are the exact opposite of ancestors. This provides a way to document all forks (and their forks) of an original or root component.",
              "items": {"$ref": "#/definitions/component"}
            },
            "variants": {
              "type": "array",
              "title": "Variants",
              "description": "Variants describe relations where the relationship between the components is not known. For example, if Component A contains nearly identical code to Component B. They are both related, but it is unclear if one is derived from the other, or if they share a common ancestor.",
              "items": {"$ref": "#/definitions/component"}
            },
            "commits": {
              "type": "array",
              "title": "Commits",
              "description": "A list of zero or more commits which provide a trail describing how the component deviates from an ancestor, descendant, or variant.",
              "items": {"$ref": "#/definitions/commit"}
            },
            "patches": {
              "type": "array",
              "title": "Patches",
              "description": ">A list of zero or more patches describing how the component deviates from an ancestor, descendant, or variant. Patches may be complementary to commits or may be used in place of commits.",
              "items": {"$ref": "#/definitions/patch"}
            },
            "notes": {
              "type": "string",
              "title": "Notes",
              "description": "Notes, observations, and other non-structured commentary describing the components pedigree."
            }
          }
        },
        "externalReferences": {
          "type": "array",
          "items": {"$ref": "#/definitions/externalReference"},
          "title": "External References",
          "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
        },
        "components": {
          "type": "array",
          "items": {"$ref": "#/definitions/component"},
          "uniqueItems": true,
          "title": "Components",
          "description": "A list of software and hardware components included in the parent component. This is not a dependency tree. It provides a way to specify a hierarchical representation of component assemblies, similar to system &#8594; subsystem &#8594; parts assembly in physical supply chains."
        },
        "evidence": {
          "$ref": "#/definitions/componentEvidence",
          "title": "Evidence",
          "description": "Provides the ability to document evidence collected through various forms of extraction or analysis."
        },
        "releaseNotes": {
          "$ref": "#/definitions/releaseNotes",
          "title": "Release notes",
          "description": "Specifies optional release notes."
        },
         "modelCard": {
          "$ref": "#/definitions/modelCard",
          "title": "AI/ML Model Card"
        },
        "data": {
          "type": "array",
          "items": {"$ref": "#/definitions/componentData"},
          "title": "Data",
          "description": "This object SHOULD be specified for any component of type `data` and MUST NOT be specified for other component types."
        },
        "cryptoProperties": {
          "$ref": "#/definitions/cryptoProperties",
          "title": "Cryptographic Properties"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
          "items": {"$ref": "#/definitions/property"}
        },
        "tags": {
          "$ref": "#/definitions/tags",
          "title": "Tags"
        },
        "signature": {
          "$ref": "#/definitions/signature",
          "title": "Signature",
          "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
        }
      }
    },
    "swid": {
      "type": "object",
      "title": "SWID Tag",
      "description": "Specifies metadata and content for ISO-IEC 19770-2 Software Identification (SWID) Tags.",
      "required": [
        "tagId",
        "name"
      ],
      "additionalProperties": false,
      "properties": {
        "tagId": {
          "type": "string",
          "title": "Tag ID",
          "description": "Maps to the tagId of a SoftwareIdentity."
        },
        "name": {
          "type": "string",
          "title": "Name",
          "description": "Maps to the name of a SoftwareIdentity."
        },
        "version": {
          "type": "string",
          "title": "Version",
          "default": "0.0",
          "description": "Maps to the version of a SoftwareIdentity."
        },
        "tagVersion": {
          "type": "integer",
          "title": "Tag Version",
          "default": 0,
          "description": "Maps to the tagVersion of a SoftwareIdentity."
        },
        "patch": {
          "type": "boolean",
          "title": "Patch",
          "default": false,
          "description": "Maps to the patch of a SoftwareIdentity."
        },
        "text": {
          "title": "Attachment text",
          "description": "Specifies the metadata and content of the SWID tag.",
          "$ref": "#/definitions/attachment"
        },
        "url": {
          "type": "string",
          "title": "URL",
          "description": "The URL to the SWID file.",
          "format": "iri-reference"
        }
      }
    },
    "attachment": {
      "type": "object",
      "title": "Attachment",
      "description": "Specifies the metadata and content for an attachment.",
      "required": [
        "content"
      ],
      "additionalProperties": false,
      "properties": {
        "contentType": {
          "type": "string",
          "title": "Content-Type",
          "description": "Specifies the content type of the text. Defaults to text/plain if not specified.",
          "default": "text/plain"
        },
        "encoding": {
          "type": "string",
          "title": "Encoding",
          "description": "Specifies the optional encoding the text is represented in.",
          "enum": [
            "base64"
          ],
          "meta:enum": {
            "base64": "Base64 is a binary-to-text encoding scheme that represents binary data in an ASCII string."
          }
        },
        "content": {
          "type": "string",
          "title": "Attachment Text",
          "description": "The attachment data. Proactive controls such as input validation and sanitization should be employed to prevent misuse of attachment text."
        }
      }
    },
    "hash": {
      "type": "object",
      "title": "Hash",
      "required": [
        "alg",
        "content"
      ],
      "additionalProperties": false,
      "properties": {
        "alg": {
          "$ref": "#/definitions/hash-alg"
        },
        "content": {
          "$ref": "#/definitions/hash-content"
        }
      }
    },
    "hash-alg": {
      "type": "string",
      "title": "Hash Algorithm",
      "description": "The algorithm that generated the hash value.",
      "enum": [
        "MD5",
        "SHA-1",
        "SHA-256",
        "SHA-384",
        "SHA-512",
        "SHA3-256",
        "SHA3-384",
        "SHA3-512",
        "BLAKE2b-256",
        "BLAKE2b-384",
        "BLAKE2b-512",
        "BLAKE3"
      ]
    },
    "hash-content": {
      "type": "string",
      "title": "Hash Value",
      "description": "The value of the hash.",
      "examples": ["3942447fac867ae5cdb3229b658f4d48"],
      "pattern": "^([a-fA-F0-9]{32}|[a-fA-F0-9]{40}|[a-fA-F0-9]{64}|[a-fA-F0-9]{96}|[a-fA-F0-9]{128})$"
    },
    "license": {
      "type": "object",
      "title": "License",
      "oneOf": [
        {
          "required": ["id"]
        },
        {
          "required": ["name"]
        }
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the license elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "id": {
          "$ref": "spdx.schema.json",
          "title": "License ID (SPDX)",
          "description": "A valid SPDX license ID",
          "examples": ["Apache-2.0"]
        },
        "name": {
          "type": "string",
          "title": "License Name",
          "description": "If SPDX does not define the license used, this field may be used to provide the license name",
          "examples": ["Acme Software License"]
        },
        "acknowledgement": {
          "$ref": "#/definitions/licenseAcknowledgementEnumeration"
        },
        "text": {
          "title": "License text",
          "description": "An optional way to include the textual content of a license.",
          "$ref": "#/definitions/attachment"
        },
        "url": {
          "type": "string",
          "title": "License URL",
          "description": "The URL to the license file. If specified, a 'license' externalReference should also be specified for completeness",
          "examples": ["https://www.apache.org/licenses/LICENSE-2.0.txt"],
          "format": "iri-reference"
        },
        "licensing": {
          "type": "object",
          "title": "Licensing information",
          "description": "Licensing details describing the licensor/licensee, license type, renewal and expiration dates, and other important metadata",
          "additionalProperties": false,
          "properties": {
            "altIds": {
              "type": "array",
              "title": "Alternate License Identifiers",
              "description": "License identifiers that may be used to manage licenses and their lifecycle",
              "items": {
                "type": "string"
              }
            },
            "licensor": {
              "title": "Licensor",
              "description": "The individual or organization that grants a license to another individual or organization",
              "type": "object",
              "additionalProperties": false,
              "properties": {
                "organization": {
                  "title": "Licensor (Organization)",
                  "description": "The organization that granted the license",
                  "$ref": "#/definitions/organizationalEntity"
                },
                "individual": {
                  "title": "Licensor (Individual)",
                  "description": "The individual, not associated with an organization, that granted the license",
                  "$ref": "#/definitions/organizationalContact"
                }
              },
              "oneOf":[
                {
                  "required": ["organization"]
                },
                {
                  "required": ["individual"]
                }
              ]
            },
            "licensee": {
              "title": "Licensee",
              "description": "The individual or organization for which a license was granted to",
              "type": "object",
              "additionalProperties": false,
              "properties": {
                "organization": {
                  "title": "Licensee (Organization)",
                  "description": "The organization that was granted the license",
                  "$ref": "#/definitions/organizationalEntity"
                },
                "individual": {
                  "title": "Licensee (Individual)",
                  "description": "The individual, not associated with an organization, that was granted the license",
                  "$ref": "#/definitions/organizationalContact"
                }
              },
              "oneOf":[
                {
                  "required": ["organization"]
                },
                {
                  "required": ["individual"]
                }
              ]
            },
            "purchaser": {
              "title": "Purchaser",
              "description": "The individual or organization that purchased the license",
              "type": "object",
              "additionalProperties": false,
              "properties": {
                "organization": {
                  "title": "Purchaser (Organization)",
                  "description": "The organization that purchased the license",
                  "$ref": "#/definitions/organizationalEntity"
                },
                "individual": {
                  "title": "Purchaser (Individual)",
                  "description": "The individual, not associated with an organization, that purchased the license",
                  "$ref": "#/definitions/organizationalContact"
                }
              },
              "oneOf":[
                {
                  "required": ["organization"]
                },
                {
                  "required": ["individual"]
                }
              ]
            },
            "purchaseOrder": {
              "type": "string",
              "title": "Purchase Order",
              "description": "The purchase order identifier the purchaser sent to a supplier or vendor to authorize a purchase"
            },
            "licenseTypes": {
              "type": "array",
              "title": "License Type",
              "description": "The type of license(s) that was granted to the licensee.",
              "items": {
                "type": "string",
                "enum": [
                  "academic",
                  "appliance",
                  "client-access",
                  "concurrent-user",
                  "core-points",
                  "custom-metric",
                  "device",
                  "evaluation",
                  "named-user",
                  "node-locked",
                  "oem",
                  "perpetual",
                  "processor-points",
                  "subscription",
                  "user",
                  "other"
                ],
                "meta:enum": {
                  "academic": "A license that grants use of software solely for the purpose of education or research.",
                  "appliance": "A license covering use of software embedded in a specific piece of hardware.",
                  "client-access": "A Client Access License (CAL) allows client computers to access services provided by server software.",
                  "concurrent-user": "A Concurrent User license (aka floating license) limits the number of licenses for a software application and licenses are shared among a larger number of users.",
                  "core-points": "A license where the core of a computer's processor is assigned a specific number of points.",
                  "custom-metric": "A license for which consumption is measured by non-standard metrics.",
                  "device": "A license that covers a defined number of installations on computers and other types of devices.",
                  "evaluation": "A license that grants permission to install and use software for trial purposes.",
                  "named-user": "A license that grants access to the software to one or more pre-defined users.",
                  "node-locked": "A license that grants access to the software on one or more pre-defined computers or devices.",
                  "oem": "An Original Equipment Manufacturer license that is delivered with hardware, cannot be transferred to other hardware, and is valid for the life of the hardware.",
                  "perpetual": "A license where the software is sold on a one-time basis and the licensee can use a copy of the software indefinitely.",
                  "processor-points": "A license where each installation consumes points per processor.",
                  "subscription": "A license where the licensee pays a fee to use the software or service.",
                  "user": "A license that grants access to the software or service by a specified number of users.",
                  "other": "Another license type."
                }
              }
            },
            "lastRenewal": {
              "type": "string",
              "format": "date-time",
              "title": "Last Renewal",
              "description": "The timestamp indicating when the license was last renewed. For new purchases, this is often the purchase or acquisition date. For non-perpetual licenses or subscriptions, this is the timestamp of when the license was last renewed."
            },
            "expiration": {
              "type": "string",
              "format": "date-time",
              "title": "Expiration",
              "description": "The timestamp indicating when the current license expires (if applicable)."
            }
          }
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
          "items": {"$ref": "#/definitions/property"}
        }
      }
    },
    "licenseAcknowledgementEnumeration": {
      "title": "License Acknowledgement",
      "description": "Declared licenses and concluded licenses represent two different stages in the licensing process within software development. Declared licenses refer to the initial intention of the software authors regarding the licensing terms under which their code is released. On the other hand, concluded licenses are the result of a comprehensive analysis of the project's codebase to identify and confirm the actual licenses of the components used, which may differ from the initially declared licenses. While declared licenses provide an upfront indication of the licensing intentions, concluded licenses offer a more thorough understanding of the actual licensing within a project, facilitating proper compliance and risk management. Observed licenses are defined in `@.evidence.licenses`. Observed licenses form the evidence necessary to substantiate a concluded license.",
      "type": "string",
      "enum": [
        "declared",
        "concluded"
      ],
      "meta:enum": {
        "declared": "Declared licenses represent the initial intentions of authors regarding the licensing terms of their code.",
        "concluded": "Concluded licenses are verified and confirmed."
      }
    },
    "licenseChoice": {
      "title": "License Choice",
      "description": "EITHER (list of SPDX licenses and/or named licenses) OR (tuple of one SPDX License Expression)",
      "type": "array",
      "oneOf": [
        {
          "title": "Multiple licenses",
          "description": "A list of SPDX licenses and/or named licenses.",
          "type": "array",
          "items": {
            "type": "object",
            "title": "License",
            "required": ["license"],
            "additionalProperties": false,
            "properties": {
              "license": {"$ref": "#/definitions/license"}
            }
          }
        },
        {
          "title": "SPDX License Expression",
          "description": "A tuple of exactly one SPDX License Expression.",
          "type": "array",
          "additionalItems": false,
          "minItems": 1,
          "maxItems": 1,
          "items": [{
            "type": "object",
            "additionalProperties": false,
            "required": ["expression"],
            "properties": {
              "expression": {
                "type": "string",
                "title": "SPDX License Expression",
                "description": "A valid SPDX license expression.\nRefer to https://spdx.org/specifications for syntax requirements",
                "examples": [
                  "Apache-2.0 AND (MIT OR GPL-2.0-only)",
                  "GPL-3.0-only WITH Classpath-exception-2.0"
                ]
              },
              "acknowledgement": {
                "$ref": "#/definitions/licenseAcknowledgementEnumeration"
              },
              "bom-ref": {
                "$ref": "#/definitions/refType",
                "title": "BOM Reference",
                "description": "An optional identifier which can be used to reference the license elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
              }
            }
          }]
        }
      ]
    },
    "commit": {
      "type": "object",
      "title": "Commit",
      "description": "Specifies an individual commit",
      "additionalProperties": false,
      "properties": {
        "uid": {
          "type": "string",
          "title": "UID",
          "description": "A unique identifier of the commit. This may be version control specific. For example, Subversion uses revision numbers whereas git uses commit hashes."
        },
        "url": {
          "type": "string",
          "title": "URL",
          "description": "The URL to the commit. This URL will typically point to a commit in a version control system.",
          "format": "iri-reference"
        },
        "author": {
          "title": "Author",
          "description": "The author who created the changes in the commit",
          "$ref": "#/definitions/identifiableAction"
        },
        "committer": {
          "title": "Committer",
          "description": "The person who committed or pushed the commit",
          "$ref": "#/definitions/identifiableAction"
        },
        "message": {
          "type": "string",
          "title": "Message",
          "description": "The text description of the contents of the commit"
        }
      }
    },
    "patch": {
      "type": "object",
      "title": "Patch",
      "description": "Specifies an individual patch",
      "required": [
        "type"
      ],
      "additionalProperties": false,
      "properties": {
        "type": {
          "type": "string",
          "enum": [
            "unofficial",
            "monkey",
            "backport",
            "cherry-pick"
          ],
          "meta:enum": {
            "unofficial": "A patch which is not developed by the creators or maintainers of the software being patched. Refer to [https://en.wikipedia.org/wiki/Unofficial_patch](https://en.wikipedia.org/wiki/Unofficial_patch).",
            "monkey": "A patch which dynamically modifies runtime behavior. Refer to [https://en.wikipedia.org/wiki/Monkey_patch](https://en.wikipedia.org/wiki/Monkey_patch).",
            "backport": "A patch which takes code from a newer version of the software and applies it to older versions of the same software. Refer to [https://en.wikipedia.org/wiki/Backporting](https://en.wikipedia.org/wiki/Backporting).",
            "cherry-pick": "A patch created by selectively applying commits from other versions or branches of the same software."
          },
          "title": "Patch Type",
          "description": "Specifies the purpose for the patch including the resolution of defects, security issues, or new behavior or functionality."
        },
        "diff": {
          "title": "Diff",
          "description": "The patch file (or diff) that shows changes. Refer to [https://en.wikipedia.org/wiki/Diff](https://en.wikipedia.org/wiki/Diff)",
          "$ref": "#/definitions/diff"
        },
        "resolves": {
          "type": "array",
          "items": {"$ref": "#/definitions/issue"},
          "title": "Resolves",
          "description": "A collection of issues the patch resolves"
        }
      }
    },
    "diff": {
      "type": "object",
      "title": "Diff",
      "description": "The patch file (or diff) that shows changes. Refer to https://en.wikipedia.org/wiki/Diff",
      "additionalProperties": false,
      "properties": {
        "text": {
          "title": "Diff text",
          "description": "Specifies the optional text of the diff",
          "$ref": "#/definitions/attachment"
        },
        "url": {
          "type": "string",
          "title": "URL",
          "description": "Specifies the URL to the diff",
          "format": "iri-reference"
        }
      }
    },
    "issue": {
      "type": "object",
      "title": "Issue",
      "description": "An individual issue that has been resolved.",
      "required": [
        "type"
      ],
      "additionalProperties": false,
      "properties": {
        "type": {
          "type": "string",
          "enum": [
            "defect",
            "enhancement",
            "security"
          ],
          "meta:enum": {
            "defect": "A fault, flaw, or bug in software.",
            "enhancement": "A new feature or behavior in software.",
            "security": "A special type of defect which impacts security."
          },
          "title": "Issue Type",
          "description": "Specifies the type of issue"
        },
        "id": {
          "type": "string",
          "title": "Issue ID",
          "description": "The identifier of the issue assigned by the source of the issue"
        },
        "name": {
          "type": "string",
          "title": "Issue Name",
          "description": "The name of the issue"
        },
        "description": {
          "type": "string",
          "title": "Issue Description",
          "description": "A description of the issue"
        },
        "source": {
          "type": "object",
          "title": "Source",
          "description": "The source of the issue where it is documented",
          "additionalProperties": false,
          "properties": {
            "name": {
              "type": "string",
              "title": "Name",
              "description": "The name of the source.",
              "examples": [
                "National Vulnerability Database",
                "NVD",
                "Apache"
              ]
            },
            "url": {
              "type": "string",
              "title": "URL",
              "description": "The url of the issue documentation as provided by the source",
              "format": "iri-reference"
            }
          }
        },
        "references": {
          "type": "array",
          "items": {
            "type": "string",
            "format": "iri-reference"
          },
          "title": "References",
          "description": "A collection of URL's for reference. Multiple URLs are allowed.",
          "examples": ["https://example.com"]
        }
      }
    },
    "identifiableAction": {
      "type": "object",
      "title": "Identifiable Action",
      "description": "Specifies an individual commit",
      "additionalProperties": false,
      "properties": {
        "timestamp": {
          "type": "string",
          "format": "date-time",
          "title": "Timestamp",
          "description": "The timestamp in which the action occurred"
        },
        "name": {
          "type": "string",
          "title": "Name",
          "description": "The name of the individual who performed the action"
        },
        "email": {
          "type": "string",
          "format": "idn-email",
          "title": "E-mail",
          "description": "The email address of the individual who performed the action"
        }
      }
    },
    "externalReference": {
      "type": "object",
      "title": "External Reference",
      "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM.",
      "required": [
        "url",
        "type"
      ],
      "additionalProperties": false,
      "properties": {
        "url": {
          "anyOf": [
            {
              "title": "URL",
              "type": "string",
              "format": "iri-reference"
            },
            {
              "title": "BOM-Link",
              "$ref": "#/definitions/bomLink"
            }
          ],
          "title": "URL",
          "description": "The URI (URL or URN) to the external reference. External references are URIs and therefore can accept any URL scheme including https ([RFC-7230](https://www.ietf.org/rfc/rfc7230.txt)), mailto ([RFC-2368](https://www.ietf.org/rfc/rfc2368.txt)), tel ([RFC-3966](https://www.ietf.org/rfc/rfc3966.txt)), and dns ([RFC-4501](https://www.ietf.org/rfc/rfc4501.txt)). External references may also include formally registered URNs such as [CycloneDX BOM-Link](https://cyclonedx.org/capabilities/bomlink/) to reference CycloneDX BOMs or any object within a BOM. BOM-Link transforms applicable external references into relationships that can be expressed in a BOM or across BOMs."
        },
        "comment": {
          "type": "string",
          "title": "Comment",
          "description": "An optional comment describing the external reference"
        },
        "type": {
          "type": "string",
          "title": "Type",
          "description": "Specifies the type of external reference.",
          "enum": [
            "vcs",
            "issue-tracker",
            "website",
            "advisories",
            "bom",
            "mailing-list",
            "social",
            "chat",
            "documentation",
            "support",
            "source-distribution",
            "distribution",
            "distribution-intake",
            "license",
            "build-meta",
            "build-system",
            "release-notes",
            "security-contact",
            "model-card",
            "log",
            "configuration",
            "evidence",
            "formulation",
            "attestation",
            "threat-model",
            "adversary-model",
            "risk-assessment",
            "vulnerability-assertion",
            "exploitability-statement",
            "pentest-report",
            "static-analysis-report",
            "dynamic-analysis-report",
            "runtime-analysis-report",
            "component-analysis-report",
            "maturity-report",
            "certification-report",
            "codified-infrastructure",
            "quality-metrics",
            "poam",
            "electronic-signature",
            "digital-signature",
            "rfc-9116",
            "other"
          ],
          "meta:enum": {
            "vcs": "Version Control System",
            "issue-tracker": "Issue or defect tracking system, or an Application Lifecycle Management (ALM) system",
            "website": "Website",
            "advisories": "Security advisories",
            "bom": "Bill of Materials (SBOM, OBOM, HBOM, SaaSBOM, etc)",
            "mailing-list": "Mailing list or discussion group",
            "social": "Social media account",
            "chat": "Real-time chat platform",
            "documentation": "Documentation, guides, or how-to instructions",
            "support": "Community or commercial support",
            "source-distribution": "The location where the source code distributable can be obtained. This is often an archive format such as zip or tgz. The source-distribution type complements use of the version control (vcs) type.",
            "distribution": "Direct or repository download location",
            "distribution-intake": "The location where a component was published to. This is often the same as \"distribution\" but may also include specialized publishing processes that act as an intermediary.",
            "license": "The reference to the license file. If a license URL has been defined in the license node, it should also be defined as an external reference for completeness.",
            "build-meta": "Build-system specific meta file (i.e. pom.xml, package.json, .nuspec, etc)",
            "build-system": "Reference to an automated build system",
            "release-notes": "Reference to release notes",
            "security-contact": "Specifies a way to contact the maintainer, supplier, or provider in the event of a security incident. Common URIs include links to a disclosure procedure, a mailto (RFC-2368) that specifies an email address, a tel (RFC-3966) that specifies a phone number, or dns (RFC-4501) that specifies the records containing DNS Security TXT.",
            "model-card": "A model card describes the intended uses of a machine learning model, potential limitations, biases, ethical considerations, training parameters, datasets used to train the model, performance metrics, and other relevant data useful for ML transparency.",
            "log": "A record of events that occurred in a computer system or application, such as problems, errors, or information on current operations.",
            "configuration": "Parameters or settings that may be used by other components or services.",
            "evidence": "Information used to substantiate a claim.",
            "formulation": "Describes how a component or service was manufactured or deployed.",
            "attestation": "Human or machine-readable statements containing facts, evidence, or testimony.",
            "threat-model": "An enumeration of identified weaknesses, threats, and countermeasures, dataflow diagram (DFD), attack tree, and other supporting documentation in human-readable or machine-readable format.",
            "adversary-model": "The defined assumptions, goals, and capabilities of an adversary.",
            "risk-assessment": "Identifies and analyzes the potential of future events that may negatively impact individuals, assets, and/or the environment. Risk assessments may also include judgments on the tolerability of each risk.",
            "vulnerability-assertion": "A Vulnerability Disclosure Report (VDR) which asserts the known and previously unknown vulnerabilities that affect a component, service, or product including the analysis and findings describing the impact (or lack of impact) that the reported vulnerability has on a component, service, or product.",
            "exploitability-statement": "A Vulnerability Exploitability eXchange (VEX) which asserts the known vulnerabilities that do not affect a product, product family, or organization, and optionally the ones that do. The VEX should include the analysis and findings describing the impact (or lack of impact) that the reported vulnerability has on the product, product family, or organization.",
            "pentest-report": "Results from an authorized simulated cyberattack on a component or service, otherwise known as a penetration test.",
            "static-analysis-report": "SARIF or proprietary machine or human-readable report for which static analysis has identified code quality, security, and other potential issues with the source code.",
            "dynamic-analysis-report": "Dynamic analysis report that has identified issues such as vulnerabilities and misconfigurations.",
            "runtime-analysis-report": "Report generated by analyzing the call stack of a running application.",
            "component-analysis-report": "Report generated by Software Composition Analysis (SCA), container analysis, or other forms of component analysis.",
            "maturity-report": "Report containing a formal assessment of an organization, business unit, or team against a maturity model.",
            "certification-report": "Industry, regulatory, or other certification from an accredited (if applicable) certification body.",
            "codified-infrastructure": "Code or configuration that defines and provisions virtualized infrastructure, commonly referred to as Infrastructure as Code (IaC).",
            "quality-metrics": "Report or system in which quality metrics can be obtained.",
            "poam": "Plans of Action and Milestones (POAM) complement an \"attestation\" external reference. POAM is defined by NIST as a \"document that identifies tasks needing to be accomplished. It details resources required to accomplish the elements of the plan, any milestones in meeting the tasks and scheduled completion dates for the milestones\".",
            "electronic-signature": "An e-signature is commonly a scanned representation of a written signature or a stylized script of the person's name.",
            "digital-signature": "A signature that leverages cryptography, typically public/private key pairs, which provides strong authenticity verification.",
            "rfc-9116": "Document that complies with RFC-9116 (A File Format to Aid in Security Vulnerability Disclosure)",
            "other": "Use this if no other types accurately describe the purpose of the external reference."
          }
        },
        "hashes": {
          "type": "array",
          "items": {"$ref": "#/definitions/hash"},
          "title": "Hashes",
          "description": "The hashes of the external reference (if applicable)."
        }
      }
    },
    "dependency": {
      "type": "object",
      "title": "Dependency",
      "description": "Defines the direct dependencies of a component, service, or the components provided/implemented by a given component. Components or services that do not have their own dependencies MUST be declared as empty elements within the graph. Components or services that are not represented in the dependency graph MAY have unknown dependencies. It is RECOMMENDED that implementations assume this to be opaque and not an indicator of an object being dependency-free. It is RECOMMENDED to leverage compositions to indicate unknown dependency graphs.",
      "required": [
        "ref"
      ],
      "additionalProperties": false,
      "properties": {
        "ref": {
          "$ref": "#/definitions/refLinkType",
          "title": "Reference",
          "description": "References a component or service by its bom-ref attribute"
        },
        "dependsOn": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/refLinkType"
          },
          "title": "Depends On",
          "description": "The bom-ref identifiers of the components or services that are dependencies of this dependency object."
        },
        "provides": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/refLinkType"
          },
          "title": "Provides",
          "description": "The bom-ref identifiers of the components or services that define a given specification or standard, which are provided or implemented by this dependency object.\nFor example, a cryptographic library which implements a cryptographic algorithm. A component which implements another component does not imply that the implementation is in use."
        }
      }
    },
    "service": {
      "type": "object",
      "title": "Service",
      "required": [
        "name"
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the service elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "provider": {
          "title": "Provider",
          "description": "The organization that provides the service.",
          "$ref": "#/definitions/organizationalEntity"
        },
        "group": {
          "type": "string",
          "title": "Service Group",
          "description": "The grouping name, namespace, or identifier. This will often be a shortened, single name of the company or project that produced the service or domain name. Whitespace and special characters should be avoided.",
          "examples": ["com.acme"]
        },
        "name": {
          "type": "string",
          "title": "Service Name",
          "description": "The name of the service. This will often be a shortened, single name of the service.",
          "examples": ["ticker-service"]
        },
        "version": {
          "$ref": "#/definitions/version",
          "title": "Service Version",
          "description": "The service version."
        },
        "description": {
          "type": "string",
          "title": "Service Description",
          "description": "Specifies a description for the service"
        },
        "endpoints": {
          "type": "array",
          "items": {
            "type": "string",
            "format": "iri-reference"
          },
          "title": "Endpoints",
          "description": "The endpoint URIs of the service. Multiple endpoints are allowed.",
          "examples": ["https://example.com/api/v1/ticker"]
        },
        "authenticated": {
          "type": "boolean",
          "title": "Authentication Required",
          "description": "A boolean value indicating if the service requires authentication. A value of true indicates the service requires authentication prior to use. A value of false indicates the service does not require authentication."
        },
        "x-trust-boundary": {
          "type": "boolean",
          "title": "Crosses Trust Boundary",
          "description": "A boolean value indicating if use of the service crosses a trust zone or boundary. A value of true indicates that by using the service, a trust boundary is crossed. A value of false indicates that by using the service, a trust boundary is not crossed."
        },
        "trustZone": {
          "type": "string",
          "title": "Trust Zone",
          "description": "The name of the trust zone the service resides in."
        },
        "data": {
          "type": "array",
          "items": {"$ref": "#/definitions/serviceData"},
          "title": "Data",
          "description": "Specifies information about the data including the directional flow of data and the data classification."
        },
        "licenses": {
          "$ref": "#/definitions/licenseChoice",
          "title": "Component License(s)"
        },
        "externalReferences": {
          "type": "array",
          "items": {"$ref": "#/definitions/externalReference"},
          "title": "External References",
          "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
        },
        "services": {
          "type": "array",
          "items": {"$ref": "#/definitions/service"},
          "uniqueItems": true,
          "title": "Services",
          "description": "A list of services included or deployed behind the parent service. This is not a dependency tree. It provides a way to specify a hierarchical representation of service assemblies."
        },
        "releaseNotes": {
          "$ref": "#/definitions/releaseNotes",
          "title": "Release notes",
          "description": "Specifies optional release notes."
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
          "items": {"$ref": "#/definitions/property"}
        },
        "tags": {
          "$ref": "#/definitions/tags",
          "title": "Tags"
        },
        "signature": {
          "$ref": "#/definitions/signature",
          "title": "Signature",
          "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
        }
      }
    },
    "serviceData": {
      "type": "object",
      "title": "Hash Objects",
      "required": [
        "flow",
        "classification"
      ],
      "additionalProperties": false,
      "properties": {
        "flow": {
          "$ref": "#/definitions/dataFlowDirection",
          "title": "Directional Flow",
          "description": "Specifies the flow direction of the data. Direction is relative to the service. Inbound flow states that data enters the service. Outbound flow states that data leaves the service. Bi-directional states that data flows both ways and unknown states that the direction is not known."
        },
        "classification": {
          "$ref": "#/definitions/dataClassification"
        },
        "name": {
          "type": "string",
          "title": "Name",
          "description": "Name for the defined data",
          "examples": [
            "Credit card reporting"
          ]
        },
        "description": {
          "type": "string",
          "title": "Description",
          "description": "Short description of the data content and usage",
          "examples": [
            "Credit card information being exchanged in between the web app and the database"
          ]
        },
        "governance": {
          "title": "Data Governance",
          "$ref": "#/definitions/dataGovernance"
        },
        "source": {
          "type": "array",
          "items": {
            "anyOf": [
              {
                "title": "URL",
                "type": "string",
                "format": "iri-reference"
              },
              {
                "title": "BOM-Link Element",
                "$ref": "#/definitions/bomLinkElementType"
              }
            ]
          },
          "title": "Source",
          "description": "The URI, URL, or BOM-Link of the components or services the data came in from"
        },
        "destination": {
          "type": "array",
          "items": {
            "anyOf": [
              {
                "title": "URL",
                "type": "string",
                "format": "iri-reference"
              },
              {
                "title": "BOM-Link Element",
                "$ref": "#/definitions/bomLinkElementType"
              }
            ]
          },
          "title": "Destination",
          "description": "The URI, URL, or BOM-Link of the components or services the data is sent to"
        }
      }
    },
    "dataFlowDirection": {
      "type": "string",
      "enum": [
        "inbound",
        "outbound",
        "bi-directional",
        "unknown"
      ],
      "meta:enum": {
        "inbound": "Data that enters a service.",
        "outbound": "Data that exits a service.",
        "bi-directional": "Data flows in and out of the service.",
        "unknown": "The directional flow of data is not known."
      },
      "title": "Data flow direction",
      "description": "Specifies the flow direction of the data. Direction is relative to the service."
    },
    "copyright": {
      "type": "object",
      "title": "Copyright",
      "required": [
        "text"
      ],
      "additionalProperties": false,
      "properties": {
        "text": {
          "type": "string",
          "title": "Copyright Text"
        }
      }
    },
    "componentEvidence": {
      "type": "object",
      "title": "Evidence",
      "description": "Provides the ability to document evidence collected through various forms of extraction or analysis.",
      "additionalProperties": false,
      "properties": {
        "identity": {
          "title": "Identity Evidence",
          "description": "Evidence that substantiates the identity of a component. The identify may be an object or an array of identity objects. Support for specifying identify as a single object was introduced in CycloneDX v1.5. Arrays were introduced in v1.6. It is RECOMMENDED that all implementations use arrays, even if only one identity object is specified.",
          "oneOf" : [
            {
              "type": "array",
              "title": "Array of Identity Objects",
              "items": { "$ref": "#/definitions/componentIdentityEvidence" }
            },
            {
              "title": "A Single Identity Object",
              "description": "[Deprecated]",
              "$ref": "#/definitions/componentIdentityEvidence",
              "deprecated": true
            }
          ]
        },
        "occurrences": {
          "type": "array",
          "title": "Occurrences",
          "description": "Evidence of individual instances of a component spread across multiple locations.",
          "items": {
            "type": "object",
            "required": [ "location" ],
            "additionalProperties": false,
            "properties": {
              "bom-ref": {
                "$ref": "#/definitions/refType",
                "title": "BOM Reference",
                "description": "An optional identifier which can be used to reference the occurrence elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
              },
              "location": {
                "type": "string",
                "title": "Location",
                "description": "The location or path to where the component was found."
              },
              "line": {
                "type": "integer",
                "minimum": 0,
                "title": "Line Number",
                "description": "The line number where the component was found."
              },
              "offset": {
                "type": "integer",
                "minimum": 0,
                "title": "Offset",
                "description": "The offset where the component was found."
              },
              "symbol": {
                "type": "string",
                "title": "Symbol",
                "description": "The symbol name that was found associated with the component."
              },
              "additionalContext": {
                "type": "string",
                "title": "Additional Context",
                "description": "Any additional context of the detected component (e.g. a code snippet)."
              }
            }
          }
        },
        "callstack": {
          "type": "object",
          "title": "Call Stack",
          "description": "Evidence of the components use through the callstack.",
          "additionalProperties": false,
          "properties": {
            "frames": {
              "type": "array",
              "title": "Frames",
              "description": "Within a call stack, a frame is a discrete unit that encapsulates an execution context, including local variables, parameters, and the return address. As function calls are made, frames are pushed onto the stack, forming an array-like structure that orchestrates the flow of program execution and manages the sequence of function invocations.",
              "items": {
                "type": "object",
                "required": [
                  "module"
                ],
                "additionalProperties": false,
                "properties": {
                  "package": {
                    "title": "Package",
                    "description": "A package organizes modules into namespaces, providing a unique namespace for each type it contains.",
                    "type": "string"
                  },
                  "module": {
                    "title": "Module",
                    "description": "A module or class that encloses functions/methods and other code.",
                    "type": "string"
                  },
                  "function": {
                    "title": "Function",
                    "description": "A block of code designed to perform a particular task.",
                    "type": "string"
                  },
                  "parameters": {
                    "title": "Parameters",
                    "description": "Optional arguments that are passed to the module or function.",
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  },
                  "line": {
                    "title": "Line",
                    "description": "The line number the code that is called resides on.",
                    "type": "integer"
                  },
                  "column": {
                    "title": "Column",
                    "description": "The column the code that is called resides.",
                    "type": "integer"
                  },
                  "fullFilename": {
                    "title": "Full Filename",
                    "description": "The full path and filename of the module.",
                    "type": "string"
                  }
                }
              }
            }
          }
        },
        "licenses": {
          "$ref": "#/definitions/licenseChoice",
          "title": "License Evidence"
        },
        "copyright": {
          "type": "array",
          "items": {"$ref": "#/definitions/copyright"},
          "title": "Copyright Evidence",
          "description": "Copyright evidence captures intellectual property assertions, providing evidence of possible ownership and legal protection."
        }
      }
    },
    "compositions": {
      "type": "object",
      "title": "Compositions",
      "required": [
        "aggregate"
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the composition elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "aggregate": {
          "$ref": "#/definitions/aggregateType",
          "title": "Aggregate",
          "description": "Specifies an aggregate type that describe how complete a relationship is."
        },
        "assemblies": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "anyOf": [
              {
                "title": "Ref",
                "$ref": "#/definitions/refLinkType"
              },
              {
                "title": "BOM-Link Element",
                "$ref": "#/definitions/bomLinkElementType"
              }
            ]
          },
          "title": "BOM references",
          "description": "The bom-ref identifiers of the components or services being described. Assemblies refer to nested relationships whereby a constituent part may include other constituent parts. References do not cascade to child parts. References are explicit for the specified constituent part only."
        },
        "dependencies": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "type": "string"
          },
          "title": "BOM references",
          "description": "The bom-ref identifiers of the components or services being described. Dependencies refer to a relationship whereby an independent constituent part requires another independent constituent part. References do not cascade to transitive dependencies. References are explicit for the specified dependency only."
        },
        "vulnerabilities": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "type": "string"
          },
          "title": "BOM references",
          "description": "The bom-ref identifiers of the vulnerabilities being described."
        },
        "signature": {
          "$ref": "#/definitions/signature",
          "title": "Signature",
          "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
        }
      }
    },
    "aggregateType": {
      "type": "string",
      "default": "not_specified",
      "enum": [
        "complete",
        "incomplete",
        "incomplete_first_party_only",
        "incomplete_first_party_proprietary_only",
        "incomplete_first_party_opensource_only",
        "incomplete_third_party_only",
        "incomplete_third_party_proprietary_only",
        "incomplete_third_party_opensource_only",
        "unknown",
        "not_specified"
      ],
      "meta:enum": {
        "complete": "The relationship is complete. No further relationships including constituent components, services, or dependencies are known to exist.",
        "incomplete": "The relationship is incomplete. Additional relationships exist and may include constituent components, services, or dependencies.",
        "incomplete_first_party_only": "The relationship is incomplete. Only relationships for first-party components, services, or their dependencies are represented.",
        "incomplete_first_party_proprietary_only": "The relationship is incomplete. Only relationships for first-party components, services, or their dependencies are represented, limited specifically to those that are proprietary.",
        "incomplete_first_party_opensource_only": "The relationship is incomplete. Only relationships for first-party components, services, or their dependencies are represented, limited specifically to those that are opensource.",
        "incomplete_third_party_only": "The relationship is incomplete. Only relationships for third-party components, services, or their dependencies are represented.",
        "incomplete_third_party_proprietary_only": "The relationship is incomplete. Only relationships for third-party components, services, or their dependencies are represented, limited specifically to those that are proprietary.",
        "incomplete_third_party_opensource_only": "The relationship is incomplete. Only relationships for third-party components, services, or their dependencies are represented, limited specifically to those that are opensource.",
        "unknown": "The relationship may be complete or incomplete. This usually signifies a 'best-effort' to obtain constituent components, services, or dependencies but the completeness is inconclusive.",
        "not_specified": "The relationship completeness is not specified."
      }
    },
    "property": {
      "type": "object",
      "title": "Lightweight name-value pair",
      "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
      "required": [
        "name"
      ],
      "properties": {
        "name": {
          "type": "string",
          "title": "Name",
          "description": "The name of the property. Duplicate names are allowed, each potentially having a different value."
        },
        "value": {
          "type": "string",
          "title": "Value",
          "description": "The value of the property."
        }
      },
      "additionalProperties": false
    },
    "localeType": {
      "type": "string",
      "pattern": "^([a-z]{2})(-[A-Z]{2})?$",
      "title": "Locale",
      "description": "Defines a syntax for representing two character language code (ISO-639) followed by an optional two character country code. The language code MUST be lower case. If the country code is specified, the country code MUST be upper case. The language code and country code MUST be separated by a minus sign. Examples: en, en-US, fr, fr-CA"
    },
    "releaseType": {
      "type": "string",
      "examples": [
        "major",
        "minor",
        "patch",
        "pre-release",
        "internal"
      ],
      "description": "The software versioning type. It is RECOMMENDED that the release type use one of 'major', 'minor', 'patch', 'pre-release', or 'internal'. Representing all possible software release types is not practical, so standardizing on the recommended values, whenever possible, is strongly encouraged.\n\n* __major__ = A major release may contain significant changes or may introduce breaking changes.\n* __minor__ = A minor release, also known as an update, may contain a smaller number of changes than major releases.\n* __patch__ = Patch releases are typically unplanned and may resolve defects or important security issues.\n* __pre-release__ = A pre-release may include alpha, beta, or release candidates and typically have limited support. They provide the ability to preview a release prior to its general availability.\n* __internal__ = Internal releases are not for public consumption and are intended to be used exclusively by the project or manufacturer that produced it."
    },
    "note": {
      "type": "object",
      "title": "Note",
      "description": "A note containing the locale and content.",
      "required": [
        "text"
      ],
      "additionalProperties": false,
      "properties": {
        "locale": {
          "$ref": "#/definitions/localeType",
          "title": "Locale",
          "description": "The ISO-639 (or higher) language code and optional ISO-3166 (or higher) country code. Examples include: \"en\", \"en-US\", \"fr\" and \"fr-CA\""
        },
        "text": {
          "title": "Release note content",
          "description": "Specifies the full content of the release note.",
          "$ref": "#/definitions/attachment"
        }
      }
    },
    "releaseNotes": {
      "type": "object",
      "title": "Release notes",
      "required": [
        "type"
      ],
      "additionalProperties": false,
      "properties": {
        "type": {
          "$ref": "#/definitions/releaseType",
          "title": "Type",
          "description": "The software versioning type the release note describes."
        },
        "title": {
          "type": "string",
          "title": "Title",
          "description": "The title of the release."
        },
        "featuredImage": {
          "type": "string",
          "format": "iri-reference",
          "title": "Featured image",
          "description": "The URL to an image that may be prominently displayed with the release note."
        },
        "socialImage": {
          "type": "string",
          "format": "iri-reference",
          "title": "Social image",
          "description": "The URL to an image that may be used in messaging on social media platforms."
        },
        "description": {
          "type": "string",
          "title": "Description",
          "description": "A short description of the release."
        },
        "timestamp": {
          "type": "string",
          "format": "date-time",
          "title": "Timestamp",
          "description": "The date and time (timestamp) when the release note was created."
        },
        "aliases": {
          "type": "array",
          "items": {
            "type": "string"
          },
          "title": "Aliases",
          "description": "One or more alternate names the release may be referred to. This may include unofficial terms used by development and marketing teams (e.g. code names)."
        },
        "tags": {
          "$ref": "#/definitions/tags",
          "title": "Tags"
        },
        "resolves": {
          "type": "array",
          "items": {"$ref": "#/definitions/issue"},
          "title": "Resolves",
          "description": "A collection of issues that have been resolved."
        },
        "notes": {
          "type": "array",
          "items": {"$ref": "#/definitions/note"},
          "title": "Notes",
          "description": "Zero or more release notes containing the locale and content. Multiple note objects may be specified to support release notes in a wide variety of languages."
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
          "items": {"$ref": "#/definitions/property"}
        }
      }
    },
    "advisory": {
      "type": "object",
      "title": "Advisory",
      "description": "Title and location where advisory information can be obtained. An advisory is a notification of a threat to a component, service, or system.",
      "required": ["url"],
      "additionalProperties": false,
      "properties": {
        "title": {
          "type": "string",
          "title": "Title",
          "description": "An optional name of the advisory."
        },
        "url": {
          "type": "string",
          "title": "URL",
          "format": "iri-reference",
          "description": "Location where the advisory can be obtained."
        }
      }
    },
    "cwe": {
      "type": "integer",
      "minimum": 1,
      "title": "CWE",
      "description": "Integer representation of a Common Weaknesses Enumerations (CWE). For example 399 (of https://cwe.mitre.org/data/definitions/399.html)"
    },
    "severity": {
      "type": "string",
      "title": "Severity",
      "description": "Textual representation of the severity of the vulnerability adopted by the analysis method. If the analysis method uses values other than what is provided, the user is expected to translate appropriately.",
      "enum": [
        "critical",
        "high",
        "medium",
        "low",
        "info",
        "none",
        "unknown"
      ],
      "meta:enum": {
        "critical": "Critical severity",
        "high": "High severity",
        "medium": "Medium severity",
        "low": "Low severity",
        "info": "Informational warning.",
        "none": "None",
        "unknown": "The severity is not known"
      }
    },
    "scoreMethod": {
      "type": "string",
      "title": "Method",
      "description": "Specifies the severity or risk scoring methodology or standard used.",
      "enum": [
        "CVSSv2",
        "CVSSv3",
        "CVSSv31",
        "CVSSv4",
        "OWASP",
        "SSVC",
        "other"
      ],
      "meta:enum": {
        "CVSSv2": "Common Vulnerability Scoring System v2.0",
        "CVSSv3": "Common Vulnerability Scoring System v3.0",
        "CVSSv31": "Common Vulnerability Scoring System v3.1",
        "CVSSv4": "Common Vulnerability Scoring System v4.0",
        "OWASP": "OWASP Risk Rating Methodology",
        "SSVC": "Stakeholder Specific Vulnerability Categorization",
        "other": "Another severity or risk scoring methodology"
      }
    },
    "impactAnalysisState": {
      "type": "string",
      "title": "Impact Analysis State",
      "description": "Declares the current state of an occurrence of a vulnerability, after automated or manual analysis.",
      "enum": [
        "resolved",
        "resolved_with_pedigree",
        "exploitable",
        "in_triage",
        "false_positive",
        "not_affected"
      ],
      "meta:enum": {
        "resolved": "The vulnerability has been remediated.",
        "resolved_with_pedigree": "The vulnerability has been remediated and evidence of the changes are provided in the affected components pedigree containing verifiable commit history and/or diff(s).",
        "exploitable": "The vulnerability may be directly or indirectly exploitable.",
        "in_triage": "The vulnerability is being investigated.",
        "false_positive": "The vulnerability is not specific to the component or service and was falsely identified or associated.",
        "not_affected": "The component or service is not affected by the vulnerability. Justification should be specified for all not_affected cases."
      }
    },
    "impactAnalysisJustification": {
      "type": "string",
      "title": "Impact Analysis Justification",
      "description": "The rationale of why the impact analysis state was asserted.",
      "enum": [
        "code_not_present",
        "code_not_reachable",
        "requires_configuration",
        "requires_dependency",
        "requires_environment",
        "protected_by_compiler",
        "protected_at_runtime",
        "protected_at_perimeter",
        "protected_by_mitigating_control"
      ],
      "meta:enum": {
        "code_not_present": "The code has been removed or tree-shaked.",
        "code_not_reachable": "The vulnerable code is not invoked at runtime.",
        "requires_configuration": "Exploitability requires a configurable option to be set/unset.",
        "requires_dependency": "Exploitability requires a dependency that is not present.",
        "requires_environment": "Exploitability requires a certain environment which is not present.",
        "protected_by_compiler": "Exploitability requires a compiler flag to be set/unset.",
        "protected_at_runtime": "Exploits are prevented at runtime.",
        "protected_at_perimeter": "Attacks are blocked at physical, logical, or network perimeter.",
        "protected_by_mitigating_control": "Preventative measures have been implemented that reduce the likelihood and/or impact of the vulnerability."
      }
    },
    "rating": {
      "type": "object",
      "title": "Rating",
      "description": "Defines the severity or risk ratings of a vulnerability.",
      "additionalProperties": false,
      "properties": {
        "source": {
          "$ref": "#/definitions/vulnerabilitySource",
          "description": "The source that calculated the severity or risk rating of the vulnerability."
        },
        "score": {
          "type": "number",
          "title": "Score",
          "description": "The numerical score of the rating."
        },
        "severity": {
          "$ref": "#/definitions/severity",
          "description": "Textual representation of the severity that corresponds to the numerical score of the rating."
        },
        "method": {
          "$ref": "#/definitions/scoreMethod"
        },
        "vector": {
          "type": "string",
          "title": "Vector",
          "description": "Textual representation of the metric values used to score the vulnerability"
        },
        "justification": {
          "type": "string",
          "title": "Justification",
          "description": "An optional reason for rating the vulnerability as it was"
        }
      }
    },
    "vulnerabilitySource": {
      "type": "object",
      "title": "Source",
      "description": "The source of vulnerability information. This is often the organization that published the vulnerability.",
      "additionalProperties": false,
      "properties": {
        "url": {
          "type": "string",
          "title": "URL",
          "description": "The url of the vulnerability documentation as provided by the source.",
          "examples": [
            "https://nvd.nist.gov/vuln/detail/CVE-2021-39182"
          ]
        },
        "name": {
          "type": "string",
          "title": "Name",
          "description": "The name of the source.",
          "examples": [
            "NVD",
            "National Vulnerability Database",
            "OSS Index",
            "VulnDB",
            "GitHub Advisories"
          ]
        }
      }
    },
    "vulnerability": {
      "type": "object",
      "title": "Vulnerability",
      "description": "Defines a weakness in a component or service that could be exploited or triggered by a threat source.",
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the vulnerability elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "id": {
          "type": "string",
          "title": "ID",
          "description": "The identifier that uniquely identifies the vulnerability.",
          "examples": [
            "CVE-2021-39182",
            "GHSA-35m5-8cvj-8783",
            "SNYK-PYTHON-ENROCRYPT-1912876"
          ]
        },
        "source": {
          "$ref": "#/definitions/vulnerabilitySource",
          "description": "The source that published the vulnerability."
        },
        "references": {
          "type": "array",
          "title": "References",
          "description": "Zero or more pointers to vulnerabilities that are the equivalent of the vulnerability specified. Often times, the same vulnerability may exist in multiple sources of vulnerability intelligence, but have different identifiers. References provide a way to correlate vulnerabilities across multiple sources of vulnerability intelligence.",
          "items": {
            "type": "object",
            "required": [
              "id",
              "source"
            ],
            "additionalProperties": false,
            "properties": {
              "id": {
                "type": "string",
                "title": "ID",
                "description": "An identifier that uniquely identifies the vulnerability.",
                "examples": [
                  "CVE-2021-39182",
                  "GHSA-35m5-8cvj-8783",
                  "SNYK-PYTHON-ENROCRYPT-1912876"
                ]
              },
              "source": {
                "$ref": "#/definitions/vulnerabilitySource",
                "description": "The source that published the vulnerability."
              }
            }
          }
        },
        "ratings": {
          "type": "array",
          "title": "Ratings",
          "description": "List of vulnerability ratings",
          "items": {
            "$ref": "#/definitions/rating"
          }
        },
        "cwes": {
          "type": "array",
          "title": "CWEs",
          "description": "List of Common Weaknesses Enumerations (CWEs) codes that describes this vulnerability.",
          "examples": [399],
          "items": {
            "$ref": "#/definitions/cwe"
          }
        },
        "description": {
          "type": "string",
          "title": "Description",
          "description": "A description of the vulnerability as provided by the source."
        },
        "detail": {
          "type": "string",
          "title": "Details",
          "description": "If available, an in-depth description of the vulnerability as provided by the source organization. Details often include information useful in understanding root cause."
        },
        "recommendation": {
          "type": "string",
          "title": "Recommendation",
          "description": "Recommendations of how the vulnerability can be remediated or mitigated."
        },
        "workaround": {
          "type": "string",
          "title": "Workarounds",
          "description": "A bypass, usually temporary, of the vulnerability that reduces its likelihood and/or impact. Workarounds often involve changes to configuration or deployments."
        },
        "proofOfConcept": {
          "type": "object",
          "title": "Proof of Concept",
          "description": "Evidence used to reproduce the vulnerability.",
          "properties": {
            "reproductionSteps": {
              "type": "string",
              "title": "Steps to Reproduce",
              "description": "Precise steps to reproduce the vulnerability."
            },
            "environment": {
              "type": "string",
              "title": "Environment",
              "description": "A description of the environment in which reproduction was possible."
            },
            "supportingMaterial": {
              "type": "array",
              "title": "Supporting Material",
              "description": "Supporting material that helps in reproducing or understanding how reproduction is possible. This may include screenshots, payloads, and PoC exploit code.",
              "items": { "$ref": "#/definitions/attachment" }
            }
          }
        },
        "advisories": {
          "type": "array",
          "title": "Advisories",
          "description": "Published advisories of the vulnerability if provided.",
          "items": {
            "$ref": "#/definitions/advisory"
          }
        },
        "created": {
          "type": "string",
          "format": "date-time",
          "title": "Created",
          "description": "The date and time (timestamp) when the vulnerability record was created in the vulnerability database."
        },
        "published": {
          "type": "string",
          "format": "date-time",
          "title": "Published",
          "description": "The date and time (timestamp) when the vulnerability record was first published."
        },
        "updated": {
          "type": "string",
          "format": "date-time",
          "title": "Updated",
          "description": "The date and time (timestamp) when the vulnerability record was last updated."
        },
        "rejected": {
          "type": "string",
          "format": "date-time",
          "title": "Rejected",
          "description": "The date and time (timestamp) when the vulnerability record was rejected (if applicable)."
        },
        "credits": {
          "type": "object",
          "title": "Credits",
          "description": "Individuals or organizations credited with the discovery of the vulnerability.",
          "additionalProperties": false,
          "properties": {
            "organizations": {
              "type": "array",
              "title": "Organizations",
              "description": "The organizations credited with vulnerability discovery.",
              "items": {
                "$ref": "#/definitions/organizationalEntity"
              }
            },
            "individuals": {
              "type": "array",
              "title": "Individuals",
              "description": "The individuals, not associated with organizations, that are credited with vulnerability discovery.",
              "items": {
                "$ref": "#/definitions/organizationalContact"
              }
            }
          }
        },
        "tools": {
          "title": "Tools",
          "description": "The tool(s) used to identify, confirm, or score the vulnerability.",
          "oneOf": [
            {
              "type": "object",
              "title": "Tools",
              "description": "The tool(s) used to identify, confirm, or score the vulnerability.",
              "additionalProperties": false,
              "properties": {
                "components": {
                  "type": "array",
                  "items": {"$ref": "#/definitions/component"},
                  "uniqueItems": true,
                  "title": "Components",
                  "description": "A list of software and hardware components used as tools."
                },
                "services": {
                  "type": "array",
                  "items": {"$ref": "#/definitions/service"},
                  "uniqueItems": true,
                  "title": "Services",
                  "description": "A list of services used as tools. This may include microservices, function-as-a-service, and other types of network or intra-process services."
                }
              }
            },
            {
              "type": "array",
              "title": "Tools (legacy)",
              "description": "[Deprecated] The tool(s) used to identify, confirm, or score the vulnerability.",
              "items": {"$ref": "#/definitions/tool"}
            }
          ]
        },
        "analysis": {
          "type": "object",
          "title": "Impact Analysis",
          "description": "An assessment of the impact and exploitability of the vulnerability.",
          "additionalProperties": false,
          "properties": {
            "state": {
              "$ref": "#/definitions/impactAnalysisState"
            },
            "justification": {
              "$ref": "#/definitions/impactAnalysisJustification"
            },
            "response": {
              "type": "array",
              "title": "Response",
              "description": "A response to the vulnerability by the manufacturer, supplier, or project responsible for the affected component or service. More than one response is allowed. Responses are strongly encouraged for vulnerabilities where the analysis state is exploitable.",
              "items": {
                "type": "string",
                "enum": [
                  "can_not_fix",
                  "will_not_fix",
                  "update",
                  "rollback",
                  "workaround_available"
                ],
                "meta:enum": {
                  "can_not_fix": "Can not fix",
                  "will_not_fix": "Will not fix",
                  "update": "Update to a different revision or release",
                  "rollback": "Revert to a previous revision or release",
                  "workaround_available": "There is a workaround available"
                }
              }
            },
            "detail": {
              "type": "string",
              "title": "Detail",
              "description": "Detailed description of the impact including methods used during assessment. If a vulnerability is not exploitable, this field should include specific details on why the component or service is not impacted by this vulnerability."
            },
            "firstIssued": {
              "type": "string",
              "format": "date-time",
              "title": "First Issued",
              "description": "The date and time (timestamp) when the analysis was first issued."
            },
            "lastUpdated": {
              "type": "string",
              "format": "date-time",
              "title": "Last Updated",
              "description": "The date and time (timestamp) when the analysis was last updated."
            }
          }
        },
        "affects": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "type": "object",
            "required": [
              "ref"
            ],
            "additionalProperties": false,
            "properties": {
              "ref": {
                "anyOf": [
                  {
                    "title": "Ref",
                    "$ref": "#/definitions/refLinkType"
                  },
                  {
                    "title": "BOM-Link Element",
                    "$ref": "#/definitions/bomLinkElementType"
                  }
                ],
                "title": "Reference",
                "description": "References a component or service by the objects bom-ref"
              },
              "versions": {
                "type": "array",
                "title": "Versions",
                "description": "Zero or more individual versions or range of versions.",
                "items": {
                  "type": "object",
                  "oneOf": [
                    {
                      "required": ["version"]
                    },
                    {
                      "required": ["range"]
                    }
                  ],
                  "additionalProperties": false,
                  "properties": {
                    "version": {
                      "title": "Version",
                      "description": "A single version of a component or service.",
                      "$ref": "#/definitions/version"
                    },
                    "range": {
                      "title": "Version Range",
                      "description": "A version range specified in Package URL Version Range syntax (vers) which is defined at https://github.com/package-url/purl-spec/VERSION-RANGE-SPEC.rst",
                      "$ref": "#/definitions/versionRange"
                    },
                    "status": {
                      "title": "Status",
                      "description": "The vulnerability status for the version or range of versions.",
                      "$ref": "#/definitions/affectedStatus",
                      "default": "affected"
                    }
                  }
                }
              }
            }
          },
          "title": "Affects",
          "description": "The components or services that are affected by the vulnerability."
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "affectedStatus": {
      "description": "The vulnerability status of a given version or range of versions of a product. The statuses 'affected' and 'unaffected' indicate that the version is affected or unaffected by the vulnerability. The status 'unknown' indicates that it is unknown or unspecified whether the given version is affected. There can be many reasons for an 'unknown' status, including that an investigation has not been undertaken or that a vendor has not disclosed the status.",
      "type": "string",
      "enum": [
        "affected",
        "unaffected",
        "unknown"
      ],
      "meta:enum": {
        "affected": "The version is affected by the vulnerability.",
        "unaffected": "The version is not affected by the vulnerability.",
        "unknown": "It is unknown (or unspecified) whether the given version is affected."
      }
    },
    "version": {
      "description": "A single disjunctive version identifier, for a component or service.",
      "type": "string",
      "maxLength": 1024,
      "examples": [
        "9.0.14",
        "v1.33.7",
        "7.0.0-M1",
        "2.0pre1",
        "1.0.0-beta1",
        "0.8.15"
      ]
    },
    "versionRange": {
      "description": "A version range specified in Package URL Version Range syntax (vers) which is defined at https://github.com/package-url/purl-spec/VERSION-RANGE-SPEC.rst",
      "type": "string",
      "minLength": 1,
      "maxLength": 4096,
      "examples": [
        "vers:cargo/9.0.14",
        "vers:npm/1.2.3|>=2.0.0|<5.0.0",
        "vers:pypi/0.0.0|0.0.1|0.0.2|0.0.3|1.0|2.0pre1",
        "vers:tomee/>=1.0.0-beta1|<=1.7.5|>=7.0.0-M1|<=7.0.7|>=7.1.0|<=7.1.2|>=8.0.0-M1|<=8.0.1",
        "vers:gem/>=2.2.0|!= 2.2.1|<2.3.0"
      ]
    },
    "range": {
      "deprecated": true,
      "description": "Deprecated definition. use definition `versionRange` instead.",
      "$ref": "#/definitions/versionRange"
    },
    "annotations": {
      "type": "object",
      "title": "Annotations",
      "description": "A comment, note, explanation, or similar textual content which provides additional context to the object(s) being annotated.",
      "required": [
        "subjects",
        "annotator",
        "timestamp",
        "text"
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the annotation elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "subjects": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "anyOf": [
              {
                "title": "Ref",
                "$ref": "#/definitions/refLinkType"
              },
              {
                "title": "BOM-Link Element",
                "$ref": "#/definitions/bomLinkElementType"
              }
            ]
          },
          "title": "Subjects",
          "description": "The object in the BOM identified by its bom-ref. This is often a component or service, but may be any object type supporting bom-refs."
        },
        "annotator": {
          "type": "object",
          "title": "Annotator",
          "description": "The organization, person, component, or service which created the textual content of the annotation.",
          "oneOf": [
            {
              "required": [
                "organization"
              ]
            },
            {
              "required": [
                "individual"
              ]
            },
            {
              "required": [
                "component"
              ]
            },
            {
              "required": [
                "service"
              ]
            }
          ],
          "additionalProperties": false,
          "properties": {
            "organization": {
              "description": "The organization that created the annotation",
              "$ref": "#/definitions/organizationalEntity"
            },
            "individual": {
              "description": "The person that created the annotation",
              "$ref": "#/definitions/organizationalContact"
            },
            "component": {
              "description": "The tool or component that created the annotation",
              "$ref": "#/definitions/component"
            },
            "service": {
              "description": "The service that created the annotation",
              "$ref": "#/definitions/service"
            }
          }
        },
        "timestamp": {
          "type": "string",
          "format": "date-time",
          "title": "Timestamp",
          "description": "The date and time (timestamp) when the annotation was created."
        },
        "text": {
          "type": "string",
          "title": "Text",
          "description": "The textual content of the annotation."
        },
        "signature": {
          "$ref": "#/definitions/signature",
          "title": "Signature",
          "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
        }
      }
    },
    "modelCard": {
      "$comment": "Model card support in CycloneDX is derived from TensorFlow Model Card Toolkit released under the Apache 2.0 license and available from https://github.com/tensorflow/model-card-toolkit/blob/main/model_card_toolkit/schema/v0.0.2/model_card.schema.json. In addition, CycloneDX model card support includes portions of VerifyML, also released under the Apache 2.0 license and available from https://github.com/cylynx/verifyml/blob/main/verifyml/model_card_toolkit/schema/v0.0.4/model_card.schema.json.",
      "type": "object",
      "title": "Model Card",
      "description": "A model card describes the intended uses of a machine learning model and potential limitations, including biases and ethical considerations. Model cards typically contain the training parameters, which datasets were used to train the model, performance metrics, and other relevant data useful for ML transparency. This object SHOULD be specified for any component of type `machine-learning-model` and MUST NOT be specified for other component types.",
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the model card elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "modelParameters": {
          "type": "object",
          "title": "Model Parameters",
          "description": "Hyper-parameters for construction of the model.",
          "additionalProperties": false,
          "properties": {
            "approach": {
              "type": "object",
              "title": "Approach",
              "description": "The overall approach to learning used by the model for problem solving.",
              "additionalProperties": false,
              "properties": {
                "type": {
                  "type": "string",
                  "title": "Learning Type",
                  "description": "Learning types describing the learning problem or hybrid learning problem.",
                  "enum": [
                    "supervised",
                    "unsupervised",
                    "reinforcement-learning",
                    "semi-supervised",
                    "self-supervised"
                  ],
                  "meta:enum": {
                    "supervised": "Supervised machine learning involves training an algorithm on labeled data to predict or classify new data based on the patterns learned from the labeled examples.",
                    "unsupervised": "Unsupervised machine learning involves training algorithms on unlabeled data to discover patterns, structures, or relationships without explicit guidance, allowing the model to identify inherent structures or clusters within the data.",
                    "reinforcement-learning": "Reinforcement learning is a type of machine learning where an agent learns to make decisions by interacting with an environment to maximize cumulative rewards, through trial and error.",
                    "semi-supervised": "Semi-supervised machine learning utilizes a combination of labeled and unlabeled data during training to improve model performance, leveraging the benefits of both supervised and unsupervised learning techniques.",
                    "self-supervised": "Self-supervised machine learning involves training models to predict parts of the input data from other parts of the same data, without requiring external labels, enabling learning from large amounts of unlabeled data."
                  }
                }
              }
            },
            "task": {
              "type": "string",
              "title": "Task",
              "description": "Directly influences the input and/or output. Examples include classification, regression, clustering, etc."
            },
            "architectureFamily": {
              "type": "string",
              "title": "Architecture Family",
              "description": "The model architecture family such as transformer network, convolutional neural network, residual neural network, LSTM neural network, etc."
            },
            "modelArchitecture": {
              "type": "string",
              "title": "Model Architecture",
              "description": "The specific architecture of the model such as GPT-1, ResNet-50, YOLOv3, etc."
            },
            "datasets": {
              "type": "array",
              "title": "Datasets",
              "description": "The datasets used to train and evaluate the model.",
              "items" : {
                "oneOf" : [
                  {
                    "title": "Inline Data Information",
                    "$ref": "#/definitions/componentData"
                  },
                  {
                    "type": "object",
                    "title": "Data Reference",
                    "additionalProperties": false,
                    "properties": {
                      "ref": {
                        "anyOf": [
                          {
                            "title": "Ref",
                            "$ref": "#/definitions/refLinkType"
                          },
                          {
                            "title": "BOM-Link Element",
                            "$ref": "#/definitions/bomLinkElementType"
                          }
                        ],
                        "title": "Reference",
                        "description": "References a data component by the components bom-ref attribute"
                      }
                    }
                  }
                ]
              }
            },
            "inputs": {
              "type": "array",
              "title": "Inputs",
              "description": "The input format(s) of the model",
              "items": { "$ref": "#/definitions/inputOutputMLParameters" }
            },
            "outputs": {
              "type": "array",
              "title": "Outputs",
              "description": "The output format(s) from the model",
              "items": { "$ref": "#/definitions/inputOutputMLParameters" }
            }
          }
        },
        "quantitativeAnalysis": {
          "type": "object",
          "title": "Quantitative Analysis",
          "description": "A quantitative analysis of the model",
          "additionalProperties": false,
          "properties": {
            "performanceMetrics": {
              "type": "array",
              "title": "Performance Metrics",
              "description": "The model performance metrics being reported. Examples may include accuracy, F1 score, precision, top-3 error rates, MSC, etc.",
              "items": { "$ref": "#/definitions/performanceMetric" }
            },
            "graphics": { "$ref": "#/definitions/graphicsCollection" }
          }
        },
        "considerations": {
          "type": "object",
          "title": "Considerations",
          "description": "What considerations should be taken into account regarding the model's construction, training, and application?",
          "additionalProperties": false,
          "properties": {
            "users": {
              "type": "array",
              "title": "Users",
              "description": "Who are the intended users of the model?",
              "items": {
                "type": "string"
              }
            },
            "useCases": {
              "type": "array",
              "title": "Use Cases",
              "description": "What are the intended use cases of the model?",
              "items": {
                "type": "string"
              }
            },
            "technicalLimitations": {
              "type": "array",
              "title": "Technical Limitations",
              "description": "What are the known technical limitations of the model? E.g. What kind(s) of data should the model be expected not to perform well on? What are the factors that might degrade model performance?",
              "items": {
                "type": "string"
              }
            },
            "performanceTradeoffs": {
              "type": "array",
              "title": "Performance Tradeoffs",
              "description": "What are the known tradeoffs in accuracy/performance of the model?",
              "items": {
                "type": "string"
              }
            },
            "ethicalConsiderations": {
              "type": "array",
              "title": "Ethical Considerations",
              "description": "What are the ethical risks involved in the application of this model?",
              "items": { "$ref": "#/definitions/risk" }
            },
            "environmentalConsiderations":{
              "$ref": "#/definitions/environmentalConsiderations",
              "title": "Environmental Considerations",
              "description": "What are the various environmental impacts the corresponding machine learning model has exhibited across its lifecycle?"
            },
            "fairnessAssessments": {
              "type": "array",
              "title": "Fairness Assessments",
              "description": "How does the model affect groups at risk of being systematically disadvantaged? What are the harms and benefits to the various affected groups?",
              "items": {
                "$ref": "#/definitions/fairnessAssessment"
              }
            }
          }
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
          "items": {"$ref": "#/definitions/property"}
        }
      }
    },
    "inputOutputMLParameters": {
      "type": "object",
      "title": "Input and Output Parameters",
      "additionalProperties": false,
      "properties": {
        "format": {
          "title": "Input/Output Format",
          "description": "The data format for input/output to the model.",
          "type": "string",
          "examples": [ "string", "image", "time-series"]
        }
      }
    },
    "componentData": {
      "type": "object",
      "additionalProperties": false,
      "required": [
        "type"
      ],
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the dataset elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links."
        },
        "type": {
          "type": "string",
          "title": "Type of Data",
          "description": "The general theme or subject matter of the data being specified.",
          "enum": [
            "source-code",
            "configuration",
            "dataset",
            "definition",
            "other"
          ],
          "meta:enum": {
            "source-code": "Any type of code, code snippet, or data-as-code.",
            "configuration": "Parameters or settings that may be used by other components.",
            "dataset": "A collection of data.",
            "definition": "Data that can be used to create new instances of what the definition defines.",
            "other": "Any other type of data that does not fit into existing definitions."
          }
        },
        "name": {
          "title": "Dataset Name",
          "description": "The name of the dataset.",
          "type": "string"
        },
        "contents": {
          "type": "object",
          "title": "Data Contents",
          "description": "The contents or references to the contents of the data being described.",
          "additionalProperties": false,
          "properties": {
            "attachment": {
              "title": "Data Attachment",
              "description": "An optional way to include textual or encoded data.",
              "$ref": "#/definitions/attachment"
            },
            "url": {
              "type": "string",
              "title": "Data URL",
              "description": "The URL to where the data can be retrieved.",
              "format": "iri-reference"
            },
            "properties": {
              "type": "array",
              "title": "Configuration Properties",
              "description": "Provides the ability to document name-value parameters used for configuration.",
              "items": {
                "$ref": "#/definitions/property"
              }
            }
          }
        },
        "classification": {
          "$ref": "#/definitions/dataClassification"
        },
        "sensitiveData": {
          "type": "array",
          "title": "Sensitive Data",
          "description": "A description of any sensitive data in a dataset.",
          "items": {
            "type": "string"
          }
        },
        "graphics": { "$ref": "#/definitions/graphicsCollection" },
        "description": {
          "title": "Dataset Description",
          "description": "A description of the dataset. Can describe size of dataset, whether it's used for source code, training, testing, or validation, etc.",
          "type": "string"
        },
        "governance": {
          "title": "Data Governance",
          "$ref": "#/definitions/dataGovernance"
        }
      }
    },
    "dataGovernance": {
      "type": "object",
      "title": "Data Governance",
      "description": "Data governance captures information regarding data ownership, stewardship, and custodianship, providing insights into the individuals or entities responsible for managing, overseeing, and safeguarding the data throughout its lifecycle.",
      "additionalProperties": false,
      "properties": {
        "custodians": {
          "type": "array",
          "title": "Data Custodians",
          "description": "Data custodians are responsible for the safe custody, transport, and storage of data.",
          "items": { "$ref": "#/definitions/dataGovernanceResponsibleParty" }
        },
        "stewards": {
          "type": "array",
          "title": "Data Stewards",
          "description": "Data stewards are responsible for data content, context, and associated business rules.",
          "items": { "$ref": "#/definitions/dataGovernanceResponsibleParty" }
        },
        "owners": {
          "type": "array",
          "title": "Data Owners",
          "description": "Data owners are concerned with risk and appropriate access to data.",
          "items": { "$ref": "#/definitions/dataGovernanceResponsibleParty" }
        }
      }
    },
    "dataGovernanceResponsibleParty": {
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "organization": {
          "title": "Organization",
          "$ref": "#/definitions/organizationalEntity"
        },
        "contact": {
          "title": "Individual",
          "$ref": "#/definitions/organizationalContact"
        }
      },
      "oneOf":[
        {
          "required": ["organization"]
        },
        {
          "required": ["contact"]
        }
      ]
    },
    "graphicsCollection": {
      "type": "object",
      "title": "Graphics Collection",
      "description": "A collection of graphics that represent various measurements.",
      "additionalProperties": false,
      "properties": {
        "description": {
          "title": "Description",
          "description": "A description of this collection of graphics.",
          "type": "string"
        },
        "collection": {
          "title": "Collection",
          "description": "A collection of graphics.",
          "type": "array",
          "items": { "$ref": "#/definitions/graphic" }
        }
      }
    },
    "graphic": {
      "type": "object",
      "title": "Graphic",
      "additionalProperties": false,
      "properties": {
        "name": {
          "title": "Name",
          "description": "The name of the graphic.",
          "type": "string"
        },
        "image": {
          "title": "Graphic Image",
          "description": "The graphic (vector or raster). Base64 encoding MUST be specified for binary images.",
          "$ref": "#/definitions/attachment"
        }
      }
    },
    "performanceMetric": {
      "type": "object",
      "title": "Performance Metric",
      "additionalProperties": false,
      "properties": {
        "type": {
          "title": "Type",
          "description": "The type of performance metric.",
          "type": "string"
        },
        "value": {
          "title": "Value",
          "description": "The value of the performance metric.",
          "type": "string"
        },
        "slice": {
          "title": "Slice",
          "description": "The name of the slice this metric was computed on. By default, assume this metric is not sliced.",
          "type": "string"
        },
        "confidenceInterval": {
          "title": "Confidence Interval",
          "description": "The confidence interval of the metric.",
          "type": "object",
          "additionalProperties": false,
          "properties": {
            "lowerBound": {
              "title": "Lower Bound",
              "description": "The lower bound of the confidence interval.",
              "type": "string"
            },
            "upperBound": {
              "title": "Upper Bound",
              "description": "The upper bound of the confidence interval.",
              "type": "string"
            }
          }
        }
      }
    },
    "risk": {
      "type": "object",
      "title": "Risk",
      "additionalProperties": false,
      "properties": {
        "name": {
          "title": "Name",
          "description": "The name of the risk.",
          "type": "string"
        },
        "mitigationStrategy": {
          "title": "Mitigation Strategy",
          "description": "Strategy used to address this risk.",
          "type": "string"
        }
      }
    },
    "fairnessAssessment": {
      "type": "object",
      "title": "Fairness Assessment",
      "description": "Information about the benefits and harms of the model to an identified at risk group.",
      "additionalProperties": false,
      "properties": {
        "groupAtRisk": {
          "type": "string",
          "title": "Group at Risk",
          "description": "The groups or individuals at risk of being systematically disadvantaged by the model."
        },
        "benefits": {
          "type": "string",
          "title": "Benefits",
          "description": "Expected benefits to the identified groups."
        },
        "harms": {
          "type": "string",
          "title": "Harms",
          "description": "Expected harms to the identified groups."
        },
        "mitigationStrategy": {
          "type": "string",
          "title": "Mitigation Strategy",
          "description": "With respect to the benefits and harms outlined, please describe any mitigation strategy implemented."
        }
      }
    },
    "dataClassification": {
      "type": "string",
      "title": "Data Classification",
      "description": "Data classification tags data according to its type, sensitivity, and value if altered, stolen, or destroyed."
    },
    "environmentalConsiderations": {
      "type": "object",
      "title": "Environmental Considerations",
      "description": "Describes various environmental impact metrics.",
      "additionalProperties": false,
      "properties": {
        "energyConsumptions": {
          "title": "Energy Consumptions",
          "description": "Describes energy consumption information incurred for one or more component lifecycle activities.",
          "type": "array",
          "items": {
            "$ref": "#/definitions/energyConsumption"
          }
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "energyConsumption": {
      "title": "Energy consumption",
      "description": "Describes energy consumption information incurred for the specified lifecycle activity.",
      "type": "object",
      "required": [
        "activity",
        "energyProviders",
        "activityEnergyCost"
      ],
      "additionalProperties": false,
      "properties": {
        "activity": {
          "type": "string",
          "title": "Activity",
          "description": "The type of activity that is part of a machine learning model development or operational lifecycle.",
          "enum": [
            "design",
            "data-collection",
            "data-preparation",
            "training",
            "fine-tuning",
            "validation",
            "deployment",
            "inference",
            "other"
          ],
          "meta:enum": {
            "design": "A model design including problem framing, goal definition and algorithm selection.",
            "data-collection": "Model data acquisition including search, selection and transfer.",
            "data-preparation": "Model data preparation including data cleaning, labeling and conversion.",
            "training": "Model building, training and generalized tuning.",
            "fine-tuning": "Refining a trained model to produce desired outputs for a given problem space.",
            "validation": "Model validation including model output evaluation and testing.",
            "deployment": "Explicit model deployment to a target hosting infrastructure.",
            "inference": "Generating an output response from a hosted model from a set of inputs.",
            "other": "A lifecycle activity type whose description does not match currently defined values."
          }
        },
        "energyProviders": {
          "title": "Energy Providers",
          "description": "The provider(s) of the energy consumed by the associated model development lifecycle activity.",
          "type": "array",
          "items": { "$ref": "#/definitions/energyProvider" }
        },
        "activityEnergyCost": {
          "title": "Activity Energy Cost",
          "description": "The total energy cost associated with the model lifecycle activity.",
          "$ref": "#/definitions/energyMeasure"
        },
        "co2CostEquivalent": {
          "title": "CO2 Equivalent Cost",
          "description": "The CO2 cost (debit) equivalent to the total energy cost.",
          "$ref": "#/definitions/co2Measure"
        },
        "co2CostOffset": {
          "title": "CO2 Cost Offset",
          "description": "The CO2 offset (credit) for the CO2 equivalent cost.",
          "$ref": "#/definitions/co2Measure"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "energyMeasure": {
      "type": "object",
      "title": "Energy Measure",
      "description": "A measure of energy.",
      "required": [
        "value",
        "unit"
      ],
      "additionalProperties": false,
      "properties": {
        "value": {
          "type": "number",
          "title": "Value",
          "description": "Quantity of energy."
        },
        "unit": {
          "type": "string",
          "enum": [ "kWh" ],
          "title": "Unit",
          "description": "Unit of energy.",
          "meta:enum": {
            "kWh": "Kilowatt-hour (kWh) is the energy delivered by one kilowatt (kW) of power for one hour (h)."
          }
        }
      }
    },
    "co2Measure": {
      "type": "object",
      "title": "CO2 Measure",
      "description": "A measure of carbon dioxide (CO2).",
      "required": [
        "value",
        "unit"
      ],
      "additionalProperties": false,
      "properties": {
        "value": {
          "type": "number",
          "title": "Value",
          "description": "Quantity of carbon dioxide (CO2)."
        },
        "unit": {
          "type": "string",
          "enum": [ "tCO2eq" ],
          "title": "Unit",
          "description": "Unit of carbon dioxide (CO2).",
          "meta:enum": {
            "tCO2eq": "Tonnes (t) of carbon dioxide (CO2) equivalent (eq)."
          }
        }
      }
    },
    "energyProvider": {
      "type": "object",
      "title": "Energy Provider",
      "description": "Describes the physical provider of energy used for model development or operations.",
      "required": [
        "organization",
        "energySource",
        "energyProvided"
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the energy provider elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
          "$ref": "#/definitions/refType"
        },
        "description": {
          "type": "string",
          "title": "Description",
          "description": "A description of the energy provider."
        },
        "organization": {
          "type": "object",
          "title": "Organization",
          "$ref": "#/definitions/organizationalEntity"
        },
        "energySource": {
          "type": "string",
          "enum": [
            "coal",
            "oil",
            "natural-gas",
            "nuclear",
            "wind",
            "solar",
            "geothermal",
            "hydropower",
            "biofuel",
            "unknown",
            "other"
          ],
          "meta:enum": {
            "coal": "Energy produced by types of coal.",
            "oil": "Petroleum products (primarily crude oil and its derivative fuel oils).",
            "natural-gas": "Hydrocarbon gas liquids (HGL) that occur as gases at atmospheric pressure and as liquids under higher pressures including Natural gas (C5H12 and heavier), Ethane (C2H6), Propane (C3H8), etc.",
            "nuclear": "Energy produced from the cores of atoms (i.e., through nuclear fission or fusion).",
            "wind": "Energy produced from moving air.",
            "solar": "Energy produced from the sun (i.e., solar radiation).",
            "geothermal": "Energy produced from heat within the earth.",
            "hydropower": "Energy produced from flowing water.",
            "biofuel": "Liquid fuels produced from biomass feedstocks (i.e., organic materials such as plants or animals).",
            "unknown": "The energy source is unknown.",
            "other": "An energy source that is not listed."
          },
          "title": "Energy Source",
          "description": "The energy source for the energy provider."
        },
        "energyProvided": {
          "$ref": "#/definitions/energyMeasure",
          "title": "Energy Provided",
          "description": "The energy provided by the energy source for an associated activity."
        },
        "externalReferences": {
          "type": "array",
          "items": {"$ref": "#/definitions/externalReference"},
          "title": "External References",
          "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
        }
      }
    },
    "postalAddress": {
      "type": "object",
      "title": "Postal address",
      "description": "An address used to identify a contactable location.",
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the address elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
          "$ref": "#/definitions/refType"
        },
        "country": {
          "type": "string",
          "title": "Country",
          "description": "The country name or the two-letter ISO 3166-1 country code."
        },
        "region": {
          "type": "string",
          "title": "Region",
          "description": "The region or state in the country.",
          "examples": [ "Texas" ]
        },
        "locality": {
          "type": "string",
          "title": "Locality",
          "description": "The locality or city within the country.",
          "examples": [ "Austin" ]
        },
        "postOfficeBoxNumber": {
          "type": "string",
          "title": "Post Office Box Number",
          "description": "The post office box number.",
          "examples": [ "901" ]
        },
        "postalCode": {
          "type": "string",
          "title": "Postal Code",
          "description": "The postal code.",
          "examples": [ "78758" ]
        },
        "streetAddress": {
          "type": "string",
          "title": "Street Address",
          "description": "The street address.",
          "examples": [ "100 Main Street" ]
        }
      }
    },
    "formula": {
      "title": "Formula",
      "description": "Describes workflows and resources that captures rules and other aspects of how the associated BOM component or service was formed.",
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the formula elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
          "$ref": "#/definitions/refType"
        },
        "components": {
          "title": "Components",
          "description": "Transient components that are used in tasks that constitute one or more of this formula's workflows",
          "type": "array",
          "items": {
            "$ref": "#/definitions/component"
          },
          "uniqueItems": true
        },
        "services": {
          "title": "Services",
          "description": "Transient services that are used in tasks that constitute one or more of this formula's workflows",
          "type": "array",
          "items": {
            "$ref": "#/definitions/service"
          },
          "uniqueItems": true
        },
        "workflows": {
          "title": "Workflows",
          "description": "List of workflows that can be declared to accomplish specific orchestrated goals and independently triggered.",
          "$comment": "Different workflows can be designed to work together to perform end-to-end CI/CD builds and deployments.",
          "type": "array",
          "items": {
            "$ref": "#/definitions/workflow"
          },
          "uniqueItems": true
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "workflow": {
      "title": "Workflow",
      "description": "A specialized orchestration task.",
      "$comment": "Workflow are as task themselves and can trigger other workflow tasks.  These relationships can be modeled in the taskDependencies graph.",
      "type": "object",
      "required": [
        "bom-ref",
        "uid",
        "taskTypes"
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the workflow elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
          "$ref": "#/definitions/refType"
        },
        "uid": {
          "title": "Unique Identifier (UID)",
          "description": "The unique identifier for the resource instance within its deployment context.",
          "type": "string"
        },
        "name": {
          "title": "Name",
          "description": "The name of the resource instance.",
          "type": "string"
        },
        "description": {
          "title": "Description",
          "description": "A description of the resource instance.",
          "type": "string"
        },
        "resourceReferences": {
          "title": "Resource references",
          "description": "References to component or service resources that are used to realize the resource instance.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/resourceReferenceChoice"
          }
        },
        "tasks": {
          "title": "Tasks",
          "description": "The tasks that comprise the workflow.",
          "$comment": "Note that tasks can appear more than once as different instances (by name or UID).",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/task"
          }
        },
        "taskDependencies": {
          "title": "Task dependency graph",
          "description": "The graph of dependencies between tasks within the workflow.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/dependency"
          }
        },
        "taskTypes": {
          "title": "Task types",
          "description": "Indicates the types of activities performed by the set of workflow tasks.",
          "$comment": "Currently, these types reflect common CI/CD actions.",
          "type": "array",
          "items": {
            "$ref": "#/definitions/taskType"
          }
        },
        "trigger": {
          "title": "Trigger",
          "description": "The trigger that initiated the task.",
          "$ref": "#/definitions/trigger"
        },
        "steps": {
          "title": "Steps",
          "description": "The sequence of steps for the task.",
          "type": "array",
          "items": {
            "$ref": "#/definitions/step"
          },
          "uniqueItems": true
        },
        "inputs": {
          "title": "Inputs",
          "description": "Represents resources and data brought into a task at runtime by executor or task commands",
          "examples": ["a `configuration` file which was declared as a local `component` or `externalReference`"],
          "type": "array",
          "items": {
            "$ref": "#/definitions/inputType"
          },
          "uniqueItems": true
        },
        "outputs": {
          "title": "Outputs",
          "description": "Represents resources and data output from a task at runtime by executor or task commands",
          "examples": ["a log file or metrics data produced by the task"],
          "type": "array",
          "items": {
            "$ref": "#/definitions/outputType"
          },
          "uniqueItems": true
        },
        "timeStart": {
          "title": "Time start",
          "description": "The date and time (timestamp) when the task started.",
          "type": "string",
          "format": "date-time"
        },
        "timeEnd": {
          "title": "Time end",
          "description": "The date and time (timestamp) when the task ended.",
          "type": "string",
          "format": "date-time"
        },
        "workspaces": {
          "title": "Workspaces",
          "description": "A set of named filesystem or data resource shareable by workflow tasks.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/workspace"
          }
        },
        "runtimeTopology": {
          "title": "Runtime topology",
          "description": "A graph of the component runtime topology for workflow's instance.",
          "$comment": "A description of the runtime component and service topology.  This can describe a partial or complete topology used to host and execute the task (e.g., hardware, operating systems, configurations, etc.),",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/dependency"
          }
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "task": {
      "title": "Task",
      "description": "Describes the inputs, sequence of steps and resources used to accomplish a task and its output.",
      "$comment": "Tasks are building blocks for constructing assemble CI/CD workflows or pipelines.",
      "type": "object",
      "required": [
        "bom-ref",
        "uid",
        "taskTypes"
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the task elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
          "$ref": "#/definitions/refType"
        },
        "uid": {
          "title": "Unique Identifier (UID)",
          "description": "The unique identifier for the resource instance within its deployment context.",
          "type": "string"
        },
        "name": {
          "title": "Name",
          "description": "The name of the resource instance.",
          "type": "string"
        },
        "description": {
          "title": "Description",
          "description": "A description of the resource instance.",
          "type": "string"
        },
        "resourceReferences": {
          "title": "Resource references",
          "description": "References to component or service resources that are used to realize the resource instance.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/resourceReferenceChoice"
          }
        },
        "taskTypes": {
          "title": "Task types",
          "description": "Indicates the types of activities performed by the set of workflow tasks.",
          "$comment": "Currently, these types reflect common CI/CD actions.",
          "type": "array",
          "items": {
            "$ref": "#/definitions/taskType"
          }
        },
        "trigger": {
          "title": "Trigger",
          "description": "The trigger that initiated the task.",
          "$ref": "#/definitions/trigger"
        },
        "steps": {
          "title": "Steps",
          "description": "The sequence of steps for the task.",
          "type": "array",
          "items": {
            "$ref": "#/definitions/step"
          },
          "uniqueItems": true
        },
        "inputs": {
          "title": "Inputs",
          "description": "Represents resources and data brought into a task at runtime by executor or task commands",
          "examples": ["a `configuration` file which was declared as a local `component` or `externalReference`"],
          "type": "array",
          "items": {
            "$ref": "#/definitions/inputType"
          },
          "uniqueItems": true
        },
        "outputs": {
          "title": "Outputs",
          "description": "Represents resources and data output from a task at runtime by executor or task commands",
          "examples": ["a log file or metrics data produced by the task"],
          "type": "array",
          "items": {
            "$ref": "#/definitions/outputType"
          },
          "uniqueItems": true
        },
        "timeStart": {
          "title": "Time start",
          "description": "The date and time (timestamp) when the task started.",
          "type": "string",
          "format": "date-time"
        },
        "timeEnd": {
          "title": "Time end",
          "description": "The date and time (timestamp) when the task ended.",
          "type": "string",
          "format": "date-time"
        },
        "workspaces": {
          "title": "Workspaces",
          "description": "A set of named filesystem or data resource shareable by workflow tasks.",
          "type": "array",
          "items": {
            "$ref": "#/definitions/workspace"
          },
          "uniqueItems": true
        },
        "runtimeTopology": {
          "title": "Runtime topology",
          "description": "A graph of the component runtime topology for task's instance.",
          "$comment": "A description of the runtime component and service topology.  This can describe a partial or complete topology used to host and execute the task (e.g., hardware, operating systems, configurations, etc.),",
          "type": "array",
          "items": {
            "$ref": "#/definitions/dependency"
          },
          "uniqueItems": true
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "step": {
      "type": "object",
      "description": "Executes specific commands or tools in order to accomplish its owning task as part of a sequence.",
      "additionalProperties": false,
      "properties": {
        "name": {
          "title": "Name",
          "description": "A name for the step.",
          "type": "string"
        },
        "description": {
          "title": "Description",
          "description": "A description of the step.",
          "type": "string"
        },
        "commands": {
          "title": "Commands",
          "description": "Ordered list of commands or directives for the step",
          "type": "array",
          "items": {
            "$ref": "#/definitions/command"
          }
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "command": {
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "executed": {
          "title": "Executed",
          "description": "A text representation of the executed command.",
          "type": "string"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "workspace": {
      "title": "Workspace",
      "description": "A named filesystem or data resource shareable by workflow tasks.",
      "type": "object",
      "required": [
        "bom-ref",
        "uid"
      ],
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the workspace elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
          "$ref": "#/definitions/refType"
        },
        "uid": {
          "title": "Unique Identifier (UID)",
          "description": "The unique identifier for the resource instance within its deployment context.",
          "type": "string"
        },
        "name": {
          "title": "Name",
          "description": "The name of the resource instance.",
          "type": "string"
        },
        "aliases": {
          "title": "Aliases",
          "description": "The names for the workspace as referenced by other workflow tasks. Effectively, a name mapping so other tasks can use their own local name in their steps.",
          "type": "array",
          "items": {"type": "string"}
        },
        "description": {
          "title": "Description",
          "description": "A description of the resource instance.",
          "type": "string"
        },
        "resourceReferences": {
          "title": "Resource references",
          "description": "References to component or service resources that are used to realize the resource instance.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/resourceReferenceChoice"
          }
        },
        "accessMode": {
          "title": "Access mode",
          "description": "Describes the read-write access control for the workspace relative to the owning resource instance.",
          "type": "string",
          "enum": [
            "read-only",
            "read-write",
            "read-write-once",
            "write-once",
            "write-only"
          ]
        },
        "mountPath": {
          "title": "Mount path",
          "description": "A path to a location on disk where the workspace will be available to the associated task's steps.",
          "type": "string"
        },
        "managedDataType": {
          "title": "Managed data type",
          "description": "The name of a domain-specific data type the workspace represents.",
          "$comment": "This property is for CI/CD frameworks that are able to provide access to structured, managed data at a more granular level than a filesystem.",
          "examples": ["ConfigMap","Secret"],
          "type": "string"
        },
        "volumeRequest": {
          "title": "Volume request",
          "description": "Identifies the reference to the request for a specific volume type and parameters.",
          "examples": ["a kubernetes Persistent Volume Claim (PVC) name"],
          "type": "string"
        },
        "volume": {
          "title": "Volume",
          "description": "Information about the actual volume instance allocated to the workspace.",
          "$comment": "The actual volume allocated may be different than the request.",
          "examples": ["see https://kubernetes.io/docs/concepts/storage/persistent-volumes/"],
          "$ref": "#/definitions/volume"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "volume": {
      "title": "Volume",
      "description": "An identifiable, logical unit of data storage tied to a physical device.",
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "uid": {
          "title": "Unique Identifier (UID)",
          "description": "The unique identifier for the volume instance within its deployment context.",
          "type": "string"
        },
        "name": {
          "title": "Name",
          "description": "The name of the volume instance",
          "type": "string"
        },
        "mode": {
          "title": "Mode",
          "description": "The mode for the volume instance.",
          "type": "string",
          "enum": [
            "filesystem", "block"
          ],
          "default": "filesystem"
        },
        "path": {
          "title": "Path",
          "description": "The underlying path created from the actual volume.",
          "type": "string"
        },
        "sizeAllocated": {
          "title": "Size allocated",
          "description": "The allocated size of the volume accessible to the associated workspace. This should include the scalar size as well as IEC standard unit in either decimal or binary form.",
          "examples": ["10GB", "2Ti", "1Pi"],
          "type": "string"
        },
        "persistent": {
          "title": "Persistent",
          "description": "Indicates if the volume persists beyond the life of the resource it is associated with.",
          "type": "boolean"
        },
        "remote": {
          "title": "Remote",
          "description": "Indicates if the volume is remotely (i.e., network) attached.",
          "type": "boolean"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "trigger": {
      "title": "Trigger",
      "description": "Represents a resource that can conditionally activate (or fire) tasks based upon associated events and their data.",
      "type": "object",
      "additionalProperties": false,
      "required": [
        "type",
        "bom-ref",
        "uid"
      ],
      "properties": {
        "bom-ref": {
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the trigger elsewhere in the BOM. Every bom-ref MUST be unique within the BOM.\nValue SHOULD not start with the BOM-Link intro 'urn:cdx:' to avoid conflicts with BOM-Links.",
          "$ref": "#/definitions/refType"
        },
        "uid": {
          "title": "Unique Identifier (UID)",
          "description": "The unique identifier for the resource instance within its deployment context.",
          "type": "string"
        },
        "name": {
          "title": "Name",
          "description": "The name of the resource instance.",
          "type": "string"
        },
        "description": {
          "title": "Description",
          "description": "A description of the resource instance.",
          "type": "string"
        },
        "resourceReferences": {
          "title": "Resource references",
          "description": "References to component or service resources that are used to realize the resource instance.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/resourceReferenceChoice"
          }
        },
        "type": {
          "title": "Type",
          "description": "The source type of event which caused the trigger to fire.",
          "type": "string",
          "enum": [
            "manual",
            "api",
            "webhook",
            "scheduled"
          ]
        },
        "event": {
          "title": "Event",
          "description": "The event data that caused the associated trigger to activate.",
          "$ref": "#/definitions/event"
        },
        "conditions": {
          "type": "array",
          "title": "Conditions",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/condition"
          }
        },
        "timeActivated": {
          "title": "Time activated",
          "description": "The date and time (timestamp) when the trigger was activated.",
          "type": "string",
          "format": "date-time"
        },
        "inputs": {
          "title": "Inputs",
          "description": "Represents resources and data brought into a task at runtime by executor or task commands",
          "examples": ["a `configuration` file which was declared as a local `component` or `externalReference`"],
          "type": "array",
          "items": {
            "$ref": "#/definitions/inputType"
          },
          "uniqueItems": true
        },
        "outputs": {
          "title": "Outputs",
          "description": "Represents resources and data output from a task at runtime by executor or task commands",
          "examples": ["a log file or metrics data produced by the task"],
          "type": "array",
          "items": {
            "$ref": "#/definitions/outputType"
          },
          "uniqueItems": true
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "event": {
      "title": "Event",
      "description": "Represents something that happened that may trigger a response.",
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "uid": {
          "title": "Unique Identifier (UID)",
          "description": "The unique identifier of the event.",
          "type": "string"
        },
        "description": {
          "title": "Description",
          "description": "A description of the event.",
          "type": "string"
        },
        "timeReceived": {
          "title": "Time Received",
          "description": "The date and time (timestamp) when the event was received.",
          "type": "string",
          "format": "date-time"
        },
        "data": {
          "title": "Data",
          "description": "Encoding of the raw event data.",
          "$ref": "#/definitions/attachment"
        },
        "source": {
          "title": "Source",
          "description": "References the component or service that was the source of the event",
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "target": {
          "title": "Target",
          "description": "References the component or service that was the target of the event",
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "inputType": {
      "title": "Input type",
      "description": "Type that represents various input data types and formats.",
      "type": "object",
      "oneOf": [
        {
          "required": [
            "resource"
          ]
        },
        {
          "required": [
            "parameters"
          ]
        },
        {
          "required": [
            "environmentVars"
          ]
        },
        {
          "required": [
            "data"
          ]
        }
      ],
      "additionalProperties": false,
      "properties": {
        "source": {
          "title": "Source",
          "description": "A reference to the component or service that provided the input to the task (e.g., reference to a service with data flow value of `inbound`)",
          "examples": [
            "source code repository",
            "database"
          ],
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "target": {
          "title": "Target",
          "description": "A reference to the component or service that received or stored the input if not the task itself (e.g., a local, named storage workspace)",
          "examples": [
            "workspace",
            "directory"
          ],
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "resource": {
          "title": "Resource",
          "description": "A reference to an independent resource provided as an input to a task by the workflow runtime.",
          "examples": [
            "a reference to a configuration file in a repository (i.e., a bom-ref)",
            "a reference to a scanning service used in a task (i.e., a bom-ref)"
          ],
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "parameters": {
          "title": "Parameters",
          "description": "Inputs that have the form of parameters with names and values.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "$ref": "#/definitions/parameter"
          }
        },
        "environmentVars": {
          "title": "Environment variables",
          "description": "Inputs that have the form of parameters with names and values.",
          "type": "array",
          "uniqueItems": true,
          "items": {
            "oneOf": [
              {
                "$ref": "#/definitions/property"
              },
              {
                "type": "string"
              }
            ]
          }
        },
        "data": {
          "title": "Data",
          "description": "Inputs that have the form of data.",
          "$ref": "#/definitions/attachment"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "outputType": {
      "type": "object",
      "oneOf": [
        {
          "required": [
            "resource"
          ]
        },
        {
          "required": [
            "environmentVars"
          ]
        },
        {
          "required": [
            "data"
          ]
        }
      ],
      "additionalProperties": false,
      "properties": {
        "type": {
          "title": "Type",
          "description": "Describes the type of data output.",
          "type": "string",
          "enum": [
            "artifact",
            "attestation",
            "log",
            "evidence",
            "metrics",
            "other"
          ]
        },
        "source": {
          "title": "Source",
          "description": "Component or service that generated or provided the output from the task (e.g., a build tool)",
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "target": {
          "title": "Target",
          "description": "Component or service that received the output from the task (e.g., reference to an artifactory service with data flow value of `outbound`)",
          "examples": ["a log file described as an `externalReference` within its target domain."],
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "resource": {
          "title": "Resource",
          "description": "A reference to an independent resource generated as output by the task.",
          "examples": [
            "configuration file",
            "source code",
            "scanning service"
          ],
          "$ref": "#/definitions/resourceReferenceChoice"
        },
        "data": {
          "title": "Data",
          "description": "Outputs that have the form of data.",
          "$ref": "#/definitions/attachment"
        },
        "environmentVars": {
          "title": "Environment variables",
          "description": "Outputs that have the form of environment variables.",
          "type": "array",
          "items": {
            "oneOf": [
              {
                "$ref": "#/definitions/property"
              },
              {
                "type": "string"
              }
            ]
          },
          "uniqueItems": true
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "resourceReferenceChoice": {
      "title": "Resource reference choice",
      "description": "A reference to a locally defined resource (e.g., a bom-ref) or an externally accessible resource.",
      "$comment": "Enables reference to a resource that participates in a workflow; using either internal (bom-ref) or external (externalReference) types.",
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "ref": {
          "title": "BOM Reference",
          "description": "References an object by its bom-ref attribute",
          "anyOf": [
            {
              "title": "Ref",
              "$ref": "#/definitions/refLinkType"
            },
            {
              "title": "BOM-Link Element",
              "$ref": "#/definitions/bomLinkElementType"
            }
          ]
        },
        "externalReference": {
          "title": "External reference",
          "description": "Reference to an externally accessible resource.",
          "$ref": "#/definitions/externalReference"
        }
      },
      "oneOf": [
        {
          "required": [
            "ref"
          ]
        },
        {
          "required": [
            "externalReference"
          ]
        }
      ]
    },
    "condition": {
      "title": "Condition",
      "description": "A condition that was used to determine a trigger should be activated.",
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "description": {
          "title": "Description",
          "description": "Describes the set of conditions which cause the trigger to activate.",
          "type": "string"
        },
        "expression": {
          "title": "Expression",
          "description": "The logical expression that was evaluated that determined the trigger should be fired.",
          "type": "string"
        },
        "properties": {
          "type": "array",
          "title": "Properties",
          "items": {
            "$ref": "#/definitions/property"
          }
        }
      }
    },
    "taskType": {
      "type": "string",
      "enum": [
        "copy",
        "clone",
        "lint",
        "scan",
        "merge",
        "build",
        "test",
        "deliver",
        "deploy",
        "release",
        "clean",
        "other"
      ],
      "meta:enum": {
        "copy": "A task that copies software or data used to accomplish other tasks in the workflow.",
        "clone": "A task that clones a software repository into the workflow in order to retrieve its source code or data for use in a build step.",
        "lint": "A task that checks source code for programmatic and stylistic errors.",
        "scan": "A task that performs a scan against source code, or built or deployed components and services. Scans are typically run to gather or test for security vulnerabilities or policy compliance.",
        "merge": "A task that merges changes or fixes into source code prior to a build step in the workflow.",
        "build": "A task that builds the source code, dependencies and/or data into an artifact that can be deployed to and executed on target systems.",
        "test": "A task that verifies the functionality of a component or service.",
        "deliver": "A task that delivers a built artifact to one or more target repositories or storage systems.",
        "deploy": "A task that deploys a built artifact for execution on one or more target systems.",
        "release": "A task that releases a built, versioned artifact to a target repository or distribution system.",
        "clean": "A task that cleans unnecessary tools, build artifacts and/or data from workflow storage.",
        "other": "A workflow task that does not match current task type definitions."
      }
    },
    "parameter": {
      "title": "Parameter",
      "description": "A representation of a functional parameter.",
      "type": "object",
      "additionalProperties": false,
      "properties": {
        "name": {
          "title": "Name",
          "description": "The name of the parameter.",
          "type": "string"
        },
        "value": {
          "title": "Value",
          "description": "The value of the parameter.",
          "type": "string"
        },
        "dataType": {
          "title": "Data type",
          "description": "The data type of the parameter.",
          "type": "string"
        }
      }
    },
    "componentIdentityEvidence": {
      "type": "object",
      "title": "Identity Evidence",
      "description": "Evidence that substantiates the identity of a component.",
      "required": [ "field" ],
      "additionalProperties": false,
      "properties": {
        "field": {
          "type": "string",
          "enum": [
            "group", "name", "version", "purl", "cpe", "omniborId", "swhid", "swid", "hash"
          ],
          "title": "Field",
          "description": "The identity field of the component which the evidence describes."
        },
        "confidence": {
          "type": "number",
          "minimum": 0,
          "maximum": 1,
          "title": "Confidence",
          "description": "The overall confidence of the evidence from 0 - 1, where 1 is 100% confidence."
        },
        "concludedValue": {
          "type": "string",
          "title": "Concluded Value",
          "description": "The value of the field (cpe, purl, etc) that has been concluded based on the aggregate of all methods (if available)."
        },
        "methods": {
          "type": "array",
          "title": "Methods",
          "description": "The methods used to extract and/or analyze the evidence.",
          "items": {
            "type": "object",
            "required": [
              "technique" ,
              "confidence"
            ],
            "additionalProperties": false,
            "properties": {
              "technique": {
                "title": "Technique",
                "description": "The technique used in this method of analysis.",
                "type": "string",
                "enum": [
                  "source-code-analysis",
                  "binary-analysis",
                  "manifest-analysis",
                  "ast-fingerprint",
                  "hash-comparison",
                  "instrumentation",
                  "dynamic-analysis",
                  "filename",
                  "attestation",
                  "other"
                ]
              },
              "confidence": {
                "type": "number",
                "minimum": 0,
                "maximum": 1,
                "title": "Confidence",
                "description": "The confidence of the evidence from 0 - 1, where 1 is 100% confidence. Confidence is specific to the technique used. Each technique of analysis can have independent confidence."
              },
              "value": {
                "type": "string",
                "title": "Value",
                "description": "The value or contents of the evidence."
              }
            }
          }
        },
        "tools": {
          "type": "array",
          "uniqueItems": true,
          "items": {
            "anyOf": [
              {
                "title": "Ref",
                "$ref": "#/definitions/refLinkType"
              },
              {
                "title": "BOM-Link Element",
                "$ref": "#/definitions/bomLinkElementType"
              }
            ]
          },
          "title": "BOM References",
          "description": "The object in the BOM identified by its bom-ref. This is often a component or service but may be any object type supporting bom-refs. Tools used for analysis should already be defined in the BOM, either in the metadata/tools, components, or formulation."
        }
      }
    },
    "standard": {
      "type": "object",
      "title": "Standard",
      "description": "A standard may consist of regulations, industry or organizational-specific standards, maturity models, best practices, or any other requirements which can be evaluated against or attested to.",
      "additionalProperties": false,
      "properties": {
        "bom-ref": {
          "$ref": "#/definitions/refType",
          "title": "BOM Reference",
          "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM."
        },
        "name": {
          "type": "string",
          "title": "Name",
          "description": "The name of the standard. This will often be a shortened, single name of the standard."
        },
        "version": {
          "type": "string",
          "title": "Version",
          "description": "The version of the standard."
        },
        "description": {
          "type": "string",
          "title": "Description",
          "description": "The description of the standard."
        },
        "owner": {
          "type": "string",
          "title": "Owner",
          "description": "The owner of the standard, often the entity responsible for its release."
        },
        "requirements": {
          "type": "array",
          "title": "Requirements",
          "description": "The list of requirements comprising the standard.",
          "items": {
            "type": "object",
            "title": "Requirement",
            "additionalProperties": false,
            "properties": {
              "bom-ref": {
                "$ref": "#/definitions/refType",
                "title": "BOM Reference",
                "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM."
              },
              "identifier": {
                "type": "string",
                "title": "Identifier",
                "description": "The unique identifier used in the standard to identify a specific requirement. This should match what is in the standard and should not be the requirements bom-ref."
              },
              "title": {
                "type": "string",
                "title": "Title",
                "description": "The title of the requirement."
              },
              "text": {
                "type": "string",
                "title": "Text",
                "description": "The textual content of the requirement."
              },
              "descriptions": {
                "type": "array",
                "title": "Descriptions",
                "description": "The supplemental text that provides additional guidance or context to the requirement, but is not directly part of the requirement.",
                "items": { "type":  "string" }
              },
              "openCre": {
                "type": "array",
                "title": "OWASP OpenCRE Identifier(s)",
                "description": "The Common Requirements Enumeration (CRE) identifier(s). CRE is a structured and standardized framework for uniting security standards and guidelines. CRE links each section of a resource to a shared topic identifier (a Common Requirement). Through this shared topic link, all resources map to each other. Use of CRE promotes clear and unambiguous communication among stakeholders.",
                "items": {
                  "type":  "string",
                  "pattern": "^CRE:[0-9]+-[0-9]+$",
                  "examples": [ "CRE:764-507" ]
                }
              },
              "parent": {
                "$ref": "#/definitions/refLinkType",
                "title": "Parent BOM Reference",
                "description": "The optional `bom-ref` to a parent requirement. This establishes a hierarchy of requirements. Top-level requirements must not define a parent. Only child requirements should define parents."
              },
              "properties": {
                "type": "array",
                "title": "Properties",
                "description": "Provides the ability to document properties in a name-value store. This provides flexibility to include data not officially supported in the standard without having to use additional namespaces or create extensions. Unlike key-value stores, properties support duplicate names, each potentially having different values. Property names of interest to the general public are encouraged to be registered in the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy). Formal registration is OPTIONAL.",
                "items": {
                  "$ref": "#/definitions/property"
                }
              },
              "externalReferences": {
                "type": "array",
                "items": {"$ref": "#/definitions/externalReference"},
                "title": "External References",
                "description": "External references provide a way to document systems, sites, and information that may be relevant, but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
              }
            }
          }
        },
        "levels": {
          "type": "array",
          "title": "Levels",
          "description": "The list of levels associated with the standard. Some standards have different levels of compliance.",
          "items": {
            "type": "object",
            "title": "Level",
            "additionalProperties": false,
            "properties": {
              "bom-ref": {
                "$ref": "#/definitions/refType",
                "title": "BOM Reference",
                "description": "An optional identifier which can be used to reference the object elsewhere in the BOM. Every bom-ref MUST be unique within the BOM."
              },
              "identifier": {
                "type": "string",
                "title": "Identifier",
                "description": "The identifier used in the standard to identify a specific level."
              },
              "title": {
                "type": "string",
                "title": "Title",
                "description": "The title of the level."
              },
              "description": {
                "type": "string",
                "title": "Description",
                "description": "The description of the level."
              },
              "requirements": {
                "type": "array",
                "title": "Requirements",
                "description": "The list of requirement `bom-ref`s that comprise the level.",
                "items": { "$ref": "#/definitions/refLinkType" }
              }
            }
          }
        },
        "externalReferences": {
          "type": "array",
          "items": {"$ref": "#/definitions/externalReference"},
          "title": "External References",
          "description": "External references provide a way to document systems, sites, and information that may be relevant but are not included with the BOM. They may also establish specific relationships within or external to the BOM."
        },
        "signature": {
          "$ref": "#/definitions/signature",
          "title": "Signature",
          "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
        }
      }
    },
    "signature": {
      "$ref": "jsf-0.82.schema.json#/definitions/signature",
      "title": "Signature",
      "description": "Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html)."
    },
    "cryptoProperties": {
      "type": "object",
      "title": "Cryptographic Properties",
      "description": "Cryptographic assets have properties that uniquely define them and that make them actionable for further reasoning. As an example, it makes a difference if one knows the algorithm family (e.g. AES) or the specific variant or instantiation (e.g. AES-128-GCM). This is because the security level and the algorithm primitive (authenticated encryption) are only defined by the definition of the algorithm variant. The presence of a weak cryptographic algorithm like SHA1 vs. HMAC-SHA1 also makes a difference.",
      "additionalProperties": false,
      "required": [
        "assetType"
      ],
      "properties": {
        "assetType": {
          "type": "string",
          "title": "Asset Type",
          "description": "Cryptographic assets occur in several forms. Algorithms and protocols are most commonly implemented in specialized cryptographic libraries. They may, however, also be 'hardcoded' in software components. Certificates and related cryptographic material like keys, tokens, secrets or passwords are other cryptographic assets to be modelled.",
          "enum": [
            "algorithm",
            "certificate",
            "protocol",
            "related-crypto-material"
          ],
          "meta:enum": {
            "algorithm": "Mathematical function commonly used for data encryption, authentication, and digital signatures.",
            "certificate": "An electronic document that is used to provide the identity or validate a public key.",
            "protocol": "A set of rules and guidelines that govern the behavior and communication with each other.",
            "related-crypto-material": "Other cryptographic assets related to algorithms, certificates, and protocols such as keys and tokens."
          }
        },
        "algorithmProperties": {
          "type": "object",
          "title": "Algorithm Properties",
          "description": "Additional properties specific to a cryptographic algorithm.",
          "additionalProperties": false,
          "properties": {
            "primitive": {
              "type": "string",
              "title": "primitive",
              "description": "Cryptographic building blocks used in higher-level cryptographic systems and protocols. Primitives represent different cryptographic routines: deterministic random bit generators (drbg, e.g. CTR_DRBG from NIST SP800-90A-r1), message authentication codes (mac, e.g. HMAC-SHA-256), blockciphers (e.g. AES), streamciphers (e.g. Salsa20), signatures (e.g. ECDSA), hash functions (e.g. SHA-256), public-key encryption schemes (pke, e.g. RSA), extended output functions (xof, e.g. SHAKE256), key derivation functions (e.g. pbkdf2), key agreement algorithms (e.g. ECDH), key encapsulation mechanisms (e.g. ML-KEM), authenticated encryption (ae, e.g. AES-GCM) and the combination of multiple algorithms (combiner, e.g. SP800-56Cr2).",
              "enum": [
                "drbg",
                "mac",
                "block-cipher",
                "stream-cipher",
                "signature",
                "hash",
                "pke",
                "xof",
                "kdf",
                "key-agree",
                "kem",
                "ae",
                "combiner",
                "other",
                "unknown"
              ],
              "meta:enum": {
                "drbg": "Deterministic Random Bit Generator (DRBG) is a type of pseudorandom number generator designed to produce a sequence of bits from an initial seed value. DRBGs are commonly used in cryptographic applications where reproducibility of random values is important.",
                "mac": "In cryptography, a Message Authentication Code (MAC) is information used for authenticating and integrity-checking a message.",
                "block-cipher": "A block cipher is a symmetric key algorithm that operates on fixed-size blocks of data. It encrypts or decrypts the data in block units, providing confidentiality. Block ciphers are widely used in various cryptographic modes and protocols for secure data transmission.",
                "stream-cipher": "A stream cipher is a symmetric key cipher where plaintext digits are combined with a pseudorandom cipher digit stream (keystream).",
                "signature": "In cryptography, a signature is a digital representation of a message or data that proves its origin, identity, and integrity. Digital signatures are generated using cryptographic algorithms and are widely used for authentication and verification in secure communication.",
                "hash": "A hash function is a mathematical algorithm that takes an input (or 'message') and produces a fixed-size string of characters, which is typically a hash value. Hash functions are commonly used in various cryptographic applications, including data integrity verification and password hashing.",
                "pke": "Public Key Encryption (PKE) is a type of encryption that uses a pair of public and private keys for secure communication. The public key is used for encryption, while the private key is used for decryption. PKE is a fundamental component of public-key cryptography.",
                "xof": "An XOF is an extendable output function that can take arbitrary input and creates a stream of output, up to a limit determined by the size of the internal state of the hash function that underlies the XOF.",
                "kdf": "A Key Derivation Function (KDF) derives key material from another source of entropy while preserving the entropy of the input.",
                "key-agree": "In cryptography, a key-agreement is a protocol whereby two or more parties agree on a cryptographic key in such a way that both influence the outcome.",
                "kem": "A Key Encapsulation Mechanism (KEM) algorithm is a mechanism for transporting random keying material to a recipient using the recipient's public key.",
                "ae": "Authenticated Encryption (AE) is a cryptographic process that provides both confidentiality and data integrity. It ensures that the encrypted data has not been tampered with and comes from a legitimate source. AE is commonly used in secure communication protocols.",
                "combiner": "A combiner aggregates many candidates for a cryptographic primitive and generates a new candidate for the same primitive.",
                "other": "Another primitive type.",
                "unknown": "The primitive is not known."
              }
            },
            "parameterSetIdentifier": {
              "type": "string",
              "title": "Parameter Set Identifier",
              "description": "An identifier for the parameter set of the cryptographic algorithm. Examples: in AES128, '128' identifies the key length in bits, in SHA256, '256' identifies the digest length, '128' in SHAKE128 identifies its maximum security level in bits, and 'SHA2-128s' identifies a parameter set used in SLH-DSA (FIPS205)."
            },
            "curve": {
              "type": "string",
              "title": "Elliptic Curve",
              "description": "The specific underlying Elliptic Curve (EC) definition employed which is an indicator of the level of security strength, performance and complexity. Absent an authoritative source of curve names, CycloneDX recommends using curve names as defined at [https://neuromancer.sk/std/](https://neuromancer.sk/std/), the source of which can be found at [https://github.com/J08nY/std-curves](https://github.com/J08nY/std-curves)."
            },
            "executionEnvironment": {
              "type": "string",
              "title": "Execution Environment",
              "description": "The target and execution environment in which the algorithm is implemented in.",
              "enum": [
                "software-plain-ram",
                "software-encrypted-ram",
                "software-tee",
                "hardware",
                "other",
                "unknown"
              ],
              "meta:enum": {
                "software-plain-ram": "A software implementation running in plain unencrypted RAM.",
                "software-encrypted-ram": "A software implementation running in encrypted RAM.",
                "software-tee": "A software implementation running in a trusted execution environment.",
                "hardware": "A hardware implementation.",
                "other": "Another implementation environment.",
                "unknown": "The execution environment is not known."
              }
            },
            "implementationPlatform": {
              "type": "string",
              "title": "implementation platform",
              "description": "The target platform for which the algorithm is implemented. The implementation can be 'generic', running on any platform or for a specific platform.",
              "enum": [
                "generic",
                "x86_32",
                "x86_64",
                "armv7-a",
                "armv7-m",
                "armv8-a",
                "armv8-m",
                "armv9-a",
                "armv9-m",
                "s390x",
                "ppc64",
                "ppc64le",
                "other",
                "unknown"
              ]
            },
            "certificationLevel": {
              "type": "array",
              "title": "Certification Level",
              "description": "The certification that the implementation of the cryptographic algorithm has received, if any. Certifications include revisions and levels of FIPS 140 or Common Criteria of different Extended Assurance Levels (CC-EAL).",
              "items": {
                "type": "string",
                "enum": [
                  "none",
                  "fips140-1-l1",
                  "fips140-1-l2",
                  "fips140-1-l3",
                  "fips140-1-l4",
                  "fips140-2-l1",
                  "fips140-2-l2",
                  "fips140-2-l3",
                  "fips140-2-l4",
                  "fips140-3-l1",
                  "fips140-3-l2",
                  "fips140-3-l3",
                  "fips140-3-l4",
                  "cc-eal1",
                  "cc-eal1+",
                  "cc-eal2",
                  "cc-eal2+",
                  "cc-eal3",
                  "cc-eal3+",
                  "cc-eal4",
                  "cc-eal4+",
                  "cc-eal5",
                  "cc-eal5+",
                  "cc-eal6",
                  "cc-eal6+",
                  "cc-eal7",
                  "cc-eal7+",
                  "other",
                  "unknown"
                ],
                "meta:enum": {
                  "none": "No certification obtained",
                  "fips140-1-l1": "FIPS 140-1 Level 1",
                  "fips140-1-l2": "FIPS 140-1 Level 2",
                  "fips140-1-l3": "FIPS 140-1 Level 3",
                  "fips140-1-l4": "FIPS 140-1 Level 4",
                  "fips140-2-l1": "FIPS 140-2 Level 1",
                  "fips140-2-l2": "FIPS 140-2 Level 2",
                  "fips140-2-l3": "FIPS 140-2 Level 3",
                  "fips140-2-l4": "FIPS 140-2 Level 4",
                  "fips140-3-l1": "FIPS 140-3 Level 1",
                  "fips140-3-l2": "FIPS 140-3 Level 2",
                  "fips140-3-l3": "FIPS 140-3 Level 3",
                  "fips140-3-l4": "FIPS 140-3 Level 4",
                  "cc-eal1": "Common Criteria - Evaluation Assurance Level 1",
                  "cc-eal1+": "Common Criteria - Evaluation Assurance Level 1 (Augmented)",
                  "cc-eal2": "Common Criteria - Evaluation Assurance Level 2",
                  "cc-eal2+": "Common Criteria - Evaluation Assurance Level 2 (Augmented)",
                  "cc-eal3": "Common Criteria - Evaluation Assurance Level 3",
                  "cc-eal3+": "Common Criteria - Evaluation Assurance Level 3 (Augmented)",
                  "cc-eal4": "Common Criteria - Evaluation Assurance Level 4",
                  "cc-eal4+": "Common Criteria - Evaluation Assurance Level 4 (Augmented)",
                  "cc-eal5": "Common Criteria - Evaluation Assurance Level 5",
                  "cc-eal5+": "Common Criteria - Evaluation Assurance Level 5 (Augmented)",
                  "cc-eal6": "Common Criteria - Evaluation Assurance Level 6",
                  "cc-eal6+": "Common Criteria - Evaluation Assurance Level 6 (Augmented)",
                  "cc-eal7": "Common Criteria - Evaluation Assurance Level 7",
                  "cc-eal7+": "Common Criteria - Evaluation Assurance Level 7 (Augmented)",
                  "other": "Another certification",
                  "unknown": "The certification level is not known"
                }
              }
            },
            "mode": {
              "type": "string",
              "title": "Mode",
              "description": "The mode of operation in which the cryptographic algorithm (block cipher) is used.",
              "enum": [
                "cbc",
                "ecb",
                "ccm",
                "gcm",
                "cfb",
                "ofb",
                "ctr",
                "other",
                "unknown"
              ],
              "meta:enum": {
                "cbc": "Cipher block chaining",
                "ecb": "Electronic codebook",
                "ccm": "Counter with cipher block chaining message authentication code",
                "gcm": "Galois/counter",
                "cfb": "Cipher feedback",
                "ofb": "Output feedback",
                "ctr": "Counter",
                "other": "Another mode of operation",
                "unknown": "The mode of operation is not known"
              }
            },
            "padding": {
              "type": "string",
              "title": "Padding",
              "description": "The padding scheme that is used for the cryptographic algorithm.",
              "enum": [
                "pkcs5",
                "pkcs7",
                "pkcs1v15",
                "oaep",
                "raw",
                "other",
                "unknown"
              ],
              "meta:enum": {
                "pkcs5": "Public Key Cryptography Standard: Password-Based Cryptography",
                "pkcs7": "Public Key Cryptography Standard: Cryptographic Message Syntax",
                "pkcs1v15": "Public Key Cryptography Standard: RSA Cryptography v1.5",
                "oaep": "Optimal asymmetric encryption padding",
                "raw": "Raw",
                "other": "Another padding scheme",
                "unknown": "The padding scheme is not known"
              }
            },
            "cryptoFunctions": {
              "type": "array",
              "title": "Cryptographic functions",
              "description": "The cryptographic functions implemented by the cryptographic algorithm.",
              "items": {
                "type": "string",
                "enum": [
                  "generate",
                  "keygen",
                  "encrypt",
                  "decrypt",
                  "digest",
                  "tag",
                  "keyderive",
                  "sign",
                  "verify",
                  "encapsulate",
                  "decapsulate",
                  "other",
                  "unknown"
                ]
              }
            },
            "classicalSecurityLevel": {
              "type": "integer",
              "title": "classical security level",
              "description": "The classical security level that a cryptographic algorithm provides (in bits).",
              "minimum": 0
            },
            "nistQuantumSecurityLevel": {
              "type": "integer",
              "title": "NIST security strength category",
              "description": "The NIST security strength category as defined in https://csrc.nist.gov/projects/post-quantum-cryptography/post-quantum-cryptography-standardization/evaluation-criteria/security-(evaluation-criteria). A value of 0 indicates that none of the categories are met.",
              "minimum": 0,
              "maximum": 6
            }
          }
        },
        "certificateProperties": {
          "type": "object",
          "title": "Certificate Properties",
          "description": "Properties for cryptographic assets of asset type 'certificate'",
          "additionalProperties": false,
          "properties": {
            "subjectName": {
              "type": "string",
              "title": "Subject Name",
              "description": "The subject name for the certificate"
            },
            "issuerName": {
              "type": "string",
              "title": "Issuer Name",
              "description": "The issuer name for the certificate"
            },
            "notValidBefore": {
              "type": "string",
              "format": "date-time",
              "title": "Not Valid Before",
              "description": "The date and time according to ISO-8601 standard from which the certificate is valid"
            },
            "notValidAfter": {
              "type": "string",
              "format": "date-time",
              "title": "Not Valid After",
              "description": "The date and time according to ISO-8601 standard from which the certificate is not valid anymore"
            },
            "signatureAlgorithmRef": {
              "$ref": "#/definitions/refType",
              "title": "Algorithm Reference",
              "description": "The bom-ref to signature algorithm used by the certificate"
            },
            "subjectPublicKeyRef": {
              "$ref": "#/definitions/refType",
              "title": "Key reference",
              "description": "The bom-ref to the public key of the subject"
            },
            "certificateFormat": {
              "type": "string",
              "title": "Certificate Format",
              "description": "The format of the certificate",
              "examples": [
                "X.509",
                "PEM",
                "DER",
                "CVC"
              ]
            },
            "certificateExtension": {
              "type": "string",
              "title": "Certificate File Extension",
              "description": "The file extension of the certificate",
              "examples": [
                "crt",
                "pem",
                "cer",
                "der",
                "p12"
              ]
            }
          }
        },
        "relatedCryptoMaterialProperties": {
          "type": "object",
          "title": "Related Cryptographic Material Properties",
          "description": "Properties for cryptographic assets of asset type: `related-crypto-material`",
          "additionalProperties": false,
          "properties": {
            "type": {
              "type": "string",
              "title": "relatedCryptoMaterialType",
              "description": "The type for the related cryptographic material",
              "enum": [
                "private-key",
                "public-key",
                "secret-key",
                "key",
                "ciphertext",
                "signature",
                "digest",
                "initialization-vector",
                "nonce",
                "seed",
                "salt",
                "shared-secret",
                "tag",
                "additional-data",
                "password",
                "credential",
                "token",
                "other",
                "unknown"
              ],
              "meta:enum": {
                "private-key": "The confidential key of a key pair used in asymmetric cryptography.",
                "public-key": "The non-confidential key of a key pair used in asymmetric cryptography.",
                "secret-key": "A key used to encrypt and decrypt messages in symmetric cryptography.",
                "key": "A piece of information, usually an octet string, which, when processed through a cryptographic algorithm, processes cryptographic data.",
                "ciphertext": "The result of encryption performed on plaintext using an algorithm (or cipher).",
                "signature": "A cryptographic value that is calculated from the data and a key known only by the signer.",
                "digest": "The output of the hash function.",
                "initialization-vector": "A fixed-size random or pseudo-random value used as an input parameter for cryptographic algorithms.",
                "nonce": "A random or pseudo-random number that can only be used once in a cryptographic communication.",
                "seed": "The input to a pseudo-random number generator. Different seeds generate different pseudo-random sequences.",
                "salt": "A value used in a cryptographic process, usually to ensure that the results of computations for one instance cannot be reused by an attacker.",
                "shared-secret": "A piece of data known only to the parties involved, in a secure communication.",
                "tag": "A message authentication code (MAC), sometimes known as an authentication tag, is a short piece of information used for authenticating and integrity-checking a message.",
                "additional-data": "An unspecified collection of data with relevance to cryptographic activity.",
                "password": "A secret word, phrase, or sequence of characters used during authentication or authorization.",
                "credential": "Establishes the identity of a party to communication, usually in the form of cryptographic keys or passwords.",
                "token": "An object encapsulating a security identity.",
                "other": "Another type of cryptographic asset.",
                "unknown": "The type of cryptographic asset is not known."
              }
            },
            "id": {
                "type": "string",
                "title": "ID",
                "description": "The optional unique identifier for the related cryptographic material."
            },
            "state": {
                "type": "string",
                "title": "State",
                "description": "The key state as defined by NIST SP 800-57.",
                "enum": [
                    "pre-activation",
                    "active",
                    "suspended",
                    "deactivated",
                    "compromised",
                    "destroyed"
                ]
            },
            "algorithmRef": {
                "$ref": "#/definitions/refType",
                "title": "Algorithm Reference",
                "description": "The bom-ref to the algorithm used to generate the related cryptographic material."
            },
            "creationDate": {
                "type": "string",
                "format": "date-time",
                "title": "Creation Date",
                "description": "The date and time (timestamp) when the related cryptographic material was created."
            },
            "activationDate": {
                "type": "string",
                "format": "date-time",
                "title": "Activation Date",
                "description": "The date and time (timestamp) when the related cryptographic material was activated."
            },
            "updateDate": {
                "type": "string",
                "format": "date-time",
                "title": "Update Date",
                "description": "The date and time (timestamp) when the related cryptographic material was updated."
            },
            "expirationDate": {
                "type": "string",
                "format": "date-time",
                "title": "Expiration Date",
                "description": "The date and time (timestamp) when the related cryptographic material expires."
            },
            "value": {
                "type": "string",
                "title": "Value",
                "description": "The associated value of the cryptographic material."
            },
            "size": {
                "type": "integer",
                "title":"Size",
                "description": "The size of the cryptographic asset (in bits)."
            },
            "format": {
                "type": "string",
                "title": "Format",
                "description": "The format of the related cryptographic material (e.g. P8, PEM, DER)."
            },
            "securedBy": {
                "$ref": "#/definitions/securedBy",
                "title": "Secured By",
                "description": "The mechanism by which the cryptographic asset is secured by."
            }
          }
        },
        "protocolProperties": {
          "type": "object",
          "title": "Protocol Properties",
          "description": "Properties specific to cryptographic assets of type: `protocol`.",
          "additionalProperties": false,
          "properties": {
            "type": {
              "type": "string",
              "title": "Type",
              "description": "The concrete protocol type.",
              "enum": [
                "tls",
                "ssh",
                "ipsec",
                "ike",
                "sstp",
                "wpa",
                "other",
                "unknown"
              ],
              "meta:enum": {
                "tls": "Transport Layer Security",
                "ssh": "Secure Shell",
                "ipsec": "Internet Protocol Security",
                "ike": "Internet Key Exchange",
                "sstp": "Secure Socket Tunneling Protocol",
                "wpa": "Wi-Fi Protected Access",
                "other": "Another protocol type",
                "unknown": "The protocol type is not known"
              }
            },
            "version": {
              "type": "string",
              "title": "Protocol Version",
              "description": "The version of the protocol.",
              "examples": [
                "1.0",
                "1.2",
                "1.99"
              ]
            },
            "cipherSuites": {
              "type": "array",
              "title": "Cipher Suites",
              "description": "A list of cipher suites related to the protocol.",
              "items": {
                "$ref": "#/definitions/cipherSuite",
                "title": "Cipher Suite"
              }
            },
            "ikev2TransformTypes": {
              "type": "object",
              "title": "IKEv2 Transform Types",
              "description": "The IKEv2 transform types supported (types 1-4), defined in RFC7296 section 3.3.2, and additional properties.",
              "additionalProperties": false,
              "properties": {
                "encr": {
                  "$ref": "#/definitions/cryptoRefArray",
                  "title": "Encryption Algorithm (ENCR)",
                  "description": "Transform Type 1: encryption algorithms"
                },
                "prf": {
                  "$ref": "#/definitions/cryptoRefArray",
                  "title": "Pseudorandom Function (PRF)",
                  "description": "Transform Type 2: pseudorandom functions"
                },
                "integ": {
                  "$ref": "#/definitions/cryptoRefArray",
                  "title": "Integrity Algorithm (INTEG)",
                  "description": "Transform Type 3: integrity algorithms"
                },
                "ke": {
                  "$ref": "#/definitions/cryptoRefArray",
                  "title": "Key Exchange Method (KE)",
                  "description": "Transform Type 4: Key Exchange Method (KE) per RFC9370, formerly called Diffie-Hellman Group (D-H)"
                },
                "esn": {
                  "type": "boolean",
                  "title": "Extended Sequence Numbers (ESN)",
                  "description": "Specifies if an Extended Sequence Number (ESN) is used."
                },
                "auth": {
                  "$ref": "#/definitions/cryptoRefArray",
                  "title": "IKEv2 Authentication method",
                  "description": "IKEv2 Authentication method"
                }
              }
            },
            "cryptoRefArray": {
              "$ref": "#/definitions/cryptoRefArray",
              "title": "Cryptographic References",
              "description": "A list of protocol-related cryptographic assets"
            }
          }
        },
        "oid": {
          "type": "string",
          "title": "OID",
          "description": "The object identifier (OID) of the cryptographic asset."
        }
      }
    },
    "cipherSuite": {
      "type": "object",
      "title": "Cipher Suite",
      "description": "Object representing a cipher suite",
      "additionalProperties": false,
      "properties": {
        "name": {
          "type": "string",
          "title": "Common Name",
          "description": "A common name for the cipher suite.",
          "examples": [
            "TLS_DHE_RSA_WITH_AES_128_CCM"
          ]
        },
        "algorithms": {
          "type": "array",
          "title": "Related Algorithms",
          "description": "A list of algorithms related to the cipher suite.",
          "items": {
            "$ref": "#/definitions/refType",
            "title": "Algorithm reference",
            "description": "The bom-ref to algorithm cryptographic asset."
          }
        },
        "identifiers": {
          "type": "array",
          "title": "Cipher Suite Identifiers",
          "description": "A list of common identifiers for the cipher suite.",
          "items": {
            "type": "string",
            "title": "identifier",
            "description": "Cipher suite identifier",
            "examples": [
              "0xC0",
              "0x9E"
            ]
          }
        }
      }
    },
    "cryptoRefArray" : {
      "type": "array",
      "items": {
        "$ref": "#/definitions/refType"
      }
    },
    "securedBy": {
      "type": "object",
      "title": "Secured By",
      "description": "Specifies the mechanism by which the cryptographic asset is secured by",
      "additionalProperties": false,
      "properties": {
        "mechanism": {
          "type": "string",
          "title": "Mechanism",
          "description": "Specifies the mechanism by which the cryptographic asset is secured by.",
          "examples": [
            "HSM",
            "TPM",
            "SGX",
            "Software",
            "None"
          ]
        },
        "algorithmRef": {
          "$ref": "#/definitions/refType",
          "title": "Algorithm Reference",
          "description": "The bom-ref to the algorithm."
        }
      }
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "string"
      },
      "title": "Tags",
      "description": "Textual strings that aid in discovery, search, and retrieval of the associated object. Tags often serve as a way to group or categorize similar or related objects by various attributes.",
      "examples": [
        "json-parser",
        "object-persistence",
        "text-to-image",
        "translation",
        "object-detection"
      ]
    }
  }
}
