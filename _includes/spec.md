----
### Installation
{% if page.spec.name %}
Using CocoaPods:  
`pod '{{ page.spec.name }}'{% if page.spec.version %}, '~> {{ page.spec.version }}'{% endif %}`
{% endif %}

Clone this repository:  
`git clone {{ page.spec.source.git }}`

[Download] | [More...]


{% comment %}
Download:  
[{{ page.spec.download }}][Download]

Repository:  
[{{ page.spec.homepage }}][Repository]
{% endcomment %}

----

[Download]: {{ page.spec.download }}
[More...]: {{ page.spec.homepage }} 

