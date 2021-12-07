---
title: "Abusing feature rows in the Minimal Mistakes theme"
categories:
  - dev
tags:
  - minimal-mistakes
  - tricks-or-tweaks
  - liquid-tags
---

While trying to bash the home page of this site into something vaguely respectable,
I discovered that it's possible to include multiple feature rows,
and even to lightly abuse feature row to produce centered or right-justified text.

To do the former, just use unique keys in the front matter (`intro` here),
and specify them by ID in the include.

``` yaml
feature_images:
  - image_path: ...
```

and in the body:
{% raw %}
``` liquid
{% include feature_row id="feature_row" %}
{% include feature_row id="feature_images" %}
```
{% endraw %}

Voila!

![an image of two different feature rows, one below the other]({{ site.image-dir }}/{{ page.slug }}/two_feature_rows.png)

To do the latter, you can use the excerpt, ignoring any of the other fields,
and `type` to adjust justification.

``` yaml
intro:
  - excerpt: 'I can add some intro copy that's nicely centered.'
feature_images:
  - image_path: ...
```

and in the body:
{% raw %}
``` liquid
{% include feature_row id="intro" type="center" %}
{% include feature_row id="feature_images" %}
```
{% endraw %}
It comes out looking like this:

![an image of some centered text with a horizontal rule below it, followed by a feature row of images]({{ site.image-dir }}/{{ page.slug }}/text_in_place_of_feature_row.png)

One final note - because liquid tags are expanded before the markdown is parsed,
it's necessary to wrap liquid code blocks in raw tags if you want them to render correctly:

![an example of how to use raw and endraw liquid tags when including liquid syntax in code blocks]({{ site.image-dir }}/{{ page.slug }}/raw_endraw_tags.png)