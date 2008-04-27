<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY dbstyle SYSTEM "/usr/share/sgml/dsssl/docbook/html/docbook.dsl" CDATA DSSSL>
]>

<style-sheet>

   <style-specification use="docbook">
      <style-specification-body>

	;;(define nochunks #t)
	 (define %no-make-index #t)
	 (define %generate-book-titlepage% #t)
	 (define %generate-book-toc% #t)
	 (define %generate-book-toc-on-titlepage% #f)
	 (define %generate-reference-toc% #f)
	 (define %generate-reference-toc-on-titlepage% #f)
	 (define %generate-reference-titlepage% #f)
	 (define %generate-chapter-toc% #f)
	 (define %generate-partintro-on-titlepage% #f)
	 ;;(define %generate--toc% #t)
	 (define %use-id-as-filename% #t)
	 (define %chapter-autolabel% #f)
	 (define %section-autolabel% #f)
	 (define %html-ext% ".html")
	 (define %gentext-nav-use-ff% #t)
	 (define %gentext-nav-use-tables% #t)
	 (define %force-chapter-toc% #f)
	 (define %gentext-nav-tblwidth% "100%")
	 (define %shade-verbatim% #t)
	 (define %annotate-toc% #t)
	 (define %html-pubid% "-//W3C//DTD HTML 4.0 Transitional//EN")
	 ;;(define %link-mailto-url% "mailto:ziembor@faq-bot.ziembor.waw.pl")
	 (define %stylesheet-type% "text/css")
	 (define %stylesheet% "pcwfaq.css")
	 (define %body-attr% (list (list "BGCOLOR" "#FFFFFF") (list "TEXT" "#000000")))
	 ;;(define %titlepage-in-info-order% #t)
	 (define %html-header-tags% '(("META" ("NAME" "description") ("CONTENT" "taki sobie
	 teścik"))
	 ("META" ("HTTP-EQUIV" "content-type") ("content" "text/html; charset=UTF-8"))))
	 (define %spacing-paras% #f)

      </style-specification-body>
   </style-specification>

   <external-specification id="docbook" document="dbstyle">
</style-sheet>

<!-- Keep this comment at the end of the file
Local variables:
mode: sgml
sgml-omittag:nil
sgml-shorttag:nil
sgml-minimize-attributes:nil
sgml-always-quote-attributes:t
sgml-parent-document:nil
sgml-default-dtd-file:nil
sgml-exposed-tags:nil
sgml-local-catalogs:nil
sgml-local-ecat-files:nil
sgml-declaration:nil
sgml-validate-command:"nsgmls -s %s %s"
End:
-->
