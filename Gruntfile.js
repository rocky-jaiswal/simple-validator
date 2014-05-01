module.exports = function(grunt) {

	grunt.initConfig({

		// Import package manifest
		pkg: grunt.file.readJSON("simple_validator.jquery.json"),

		// Banner definitions
		meta: {
			banner: "/*\n" +
				" *  <%= pkg.title || pkg.name %> - v<%= pkg.version %>\n" +
				" *  <%= pkg.description %>\n" +
				" *  <%= pkg.homepage %>\n" +
				" *\n" +
				" *  Made by <%= pkg.author.name %>\n" +
				" *  Under <%= pkg.licenses[0].type %> License\n" +
				" */\n"
		},

		// Concat definitions
		concat: {
			dist: {
				src: ["src/jquery.simple_validator.js"],
				dest: "dist/jquery.simple_validator.js"
			},
			options: {
				banner: "<%= meta.banner %>"
			}
		},

		// Lint definitions
		jshint: {
			files: ["src/jquery.simple_validator.js", "dist/jquery.simple_validator.js"],
			options: {
				jshintrc: ".jshintrc"
			}
		},

		// Minify definitions
		uglify: {
			my_target: {
				src: ["dist/jquery.simple_validator.js"],
				dest: "dist/jquery.simple_validator.min.js"
			},
			options: {
				banner: "<%= meta.banner %>"
			}
		},

		// CoffeeScript compilation
		coffee: {
			compile: {
				files: {
					"dist/jquery.simple_validator.js" : "src/jquery.simple_validator.coffee",
					"spec/simple_validator_spec.js" : "spec/*_spec.coffee"
				}
			}
		},

		jasmine: {
			pivotal: {
				src: ["dist/**/*simple_validator.js"],
				options: {
					specs: 'spec/*_spec.js',
					vendor: [
						"http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"
					]
				}
			}
		}

	});

	grunt.loadNpmTasks("grunt-contrib-concat");
	grunt.loadNpmTasks("grunt-contrib-jshint");
	grunt.loadNpmTasks("grunt-contrib-uglify");
	grunt.loadNpmTasks("grunt-contrib-coffee");
  grunt.loadNpmTasks("grunt-contrib-jasmine");

	grunt.registerTask("default", ["coffee", "jasmine", "jshint", "uglify"]);

};
