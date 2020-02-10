module.exports = {
 
  map: false,
  plugins: {
    'postcss-typography': {
 
	    baseFontSize: "16px",
	    baseLineHeight: 1.2,  
	    scaleRatio: 1.2,
	    includeNormalize: true,
	    headerWeight: 400,
	    bodyWeight: 400,
			overrideThemeStyles: ({ rhythm }, options, styles) => ({
				'p': {
					
			    marginBottom: rhythm(0.2),
			    marginTop: rhythm(0.4),
				},
				'h5': {
					LineHeight: 1,  
			    marginBottom: rhythm(0.2),
			    marginTop: rhythm(0.5),
			    color: "hsla(0,0%,0%,0.7)",
				},
			  'h2,h3,h4': {
			  	LineHeight: 1,  
			    marginBottom: rhythm(0.2),
			    marginTop: rhythm(0.5),
			    color: "hsla(0,0%,0%,0.7)",
			  }
			})
    },
 'postcss-import': {},
  'postcss-extend': {},
  'postcss-nested': {},
  'postcss-simple-vars': {},
  'postcss-custom-media': {},

  
  'postcss-cssnext': {features: {'rem': false}},
  'lost': {},
  
  'postcss-assets': {
    loadPaths: ['images/'],
    basePath: 'public',
    cachebuster: true,
  },
 
  'postcss-font-magician': {
    custom: {
      'RobotoCon': {
        variants: {
          normal: {
            300: {
              url: {
                woff2: 'fonts/robotocondensed-light-webfont.woff2'
              }
            },
            400: {
              url: {
                woff2: 'fonts/robotocondensed-regular-webfont.woff2'
              }
            },
            700: {
              url: {
                woff2: 'fonts/robotocondensed-bold-webfont.woff2'
              }
            }
          },
          italic: {
            300: {
              url: {
                woff2: 'fonts/robotocondensed-lightitalic-webfont.woff2'
              }
            },
            400: {
              url: {
                woff2: 'fonts/robotocondensed-italic-webfont.woff2'
              }
            },
            700: {
              url: {
                woff2: 'fonts/robotocondensed-bolditalic-webfont.woff2'
              }
            }
          }
        }
      },
      'RobotoA': {
        variants: {
          normal: {
            100: {
              url: {
                woff2: 'fonts/roboto-thin-webfont.woff2'
              }
            },
            300: {
              url: {
                woff2: 'fonts/roboto-light-webfont.woff2'
              }
            },
            400: {
              url: {
                woff2: 'fonts/roboto-regular-webfont.woff2'
              }
            },
            500: {
              url: {
                woff2: 'fonts/roboto-medium-webfont.woff2'
              }
            },
            700: {
              url: {
                woff2: 'fonts/roboto-bold-webfont.woff2'
              }
            },
            900: {
              url: {
                woff2: 'fonts/roboto-black-webfont.woff2'
              }
            }
          },
          italic: {
            300: {
              url: {
                woff2: 'fonts/roboto-lightitalic-webfont.woff2'
              }
            },
            400: {
              url: {
                woff2: 'fonts/roboto-mediumitalic-webfont.woff2'
              }
            },
            700: {
              url: {
                woff2: 'fonts/roboto-bolditalic-webfont.woff2'
              }
            },
          }
        }
      }
    },
    protocol: 'https:'
  }
 


  }
}




