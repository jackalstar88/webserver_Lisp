;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: CL-USER; Base: 10 -*-
;;; $Header: /usr/local/cvsrep/hunchentoot/packages.lisp,v 1.34 2008/02/13 16:02:18 edi Exp $

;;; Copyright (c) 2004-2009, Dr. Edmund Weitz. All rights reserved.

;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:

;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.

;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.

;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package :cl-user)

(defpackage "HUNCHENTOOT"
  (:nicknames "TBNL")
  (:use :cl :cl-ppcre :chunga :flexi-streams :url-rewrite)
  (:shadow "DEFCONSTANT"
           "URL-ENCODE")
  ;; see ASDF system definition
  (:import-from :hunchentoot-asd :*hunchentoot-version*)
  #+:lispworks
  (:import-from :lw "WITH-UNIQUE-NAMES" "WHEN-LET")
  (:export "*ACCEPTOR*"
           "*ACCESS-LOG-PATHNAME*"
           "*APPROVED-RETURN-CODES*"
           "*CATCH-ERRORS-P*"
           #+:lispworks
           "*CLEANUP-FUNCTION*"
           #+:lispworks
           "*CLEANUP-INTERVAL*"
           "*CONTENT-TYPES-FOR-URL-REWRITE*"
           "*DEFAULT-CONNECTION-TIMEOUT*"
           "*DEFAULT-CONTENT-TYPE*"
           "*DEFAULT-HANDLER*"
           "*DISPATCH-TABLE*"
           "*FILE-UPLOAD-HOOK*"
           "*HANDLE-HTTP-ERRORS-P*"
           "*HEADER-STREAM*"
           "*HTTP-ERROR-HANDLER*"
           "*HUNCHENTOOT-DEFAULT-EXTERNAL-FORMAT*"
           "*LISP-ERRORS-LOG-LEVEL*"
           "*LISP-WARNINGS-LOG-LEVEL*"
           "*LISTENER*"
           "*LOG-LISP-BACKTRACES-P*"
           "*LOG-LISP-ERRORS-P*"
           "*LOG-LISP-WARNINGS-P*"
           "*MESSAGE-LOG-PATHNAME*"
           "*METHODS-FOR-POST-PARAMETERS*"
           "*REPLY*"
           "*REQUEST*"
           "*REWRITE-FOR-SESSION-URLS*"
           "*SESSION*"
           "*SESSION-GC-FREQUENCY*"
           "*SESSION-MAX-TIME*"
           "*SESSION-REMOVAL-HOOK*"
           "*SESSION-SECRET*"
           "*SHOW-LISP-BACKTRACES-P*"
           "*SHOW-LISP-ERRORS-P*"
           "*TMP-DIRECTORY*"
           "*USE-REMOTE-ADDR-FOR-SESSIONS*"
           "*USE-USER-AGENT-FOR-SESSIONS*"
           "+HTTP-ACCEPTED+"
           "+HTTP-AUTHORIZATION-REQUIRED+"
           "+HTTP-BAD-GATEWAY+"
           "+HTTP-BAD-REQUEST+"
           "+HTTP-CONFLICT+"
           "+HTTP-CONTINUE+"
           "+HTTP-CREATED+"
           "+HTTP-EXPECTATION-FAILED+"
           "+HTTP-FAILED-DEPENDENCY+"
           "+HTTP-FORBIDDEN+"
           "+HTTP-GATEWAY-TIME-OUT+"
           "+HTTP-GONE+"
           "+HTTP-INTERNAL-SERVER-ERROR+"
           "+HTTP-LENGTH-REQUIRED+"
           "+HTTP-METHOD-NOT-ALLOWED+"
           "+HTTP-MOVED-PERMANENTLY+"
           "+HTTP-MOVED-TEMPORARILY+"
           "+HTTP-MULTI-STATUS+"
           "+HTTP-MULTIPLE-CHOICES+"
           "+HTTP-NO-CONTENT+"
           "+HTTP-NON-AUTHORITATIVE-INFORMATION+"
           "+HTTP-NOT-ACCEPTABLE+"
           "+HTTP-NOT-FOUND+"
           "+HTTP-NOT-IMPLEMENTED+"
           "+HTTP-NOT-MODIFIED+"
           "+HTTP-OK+"
           "+HTTP-PARTIAL-CONTENT+"
           "+HTTP-PAYMENT-REQUIRED+"
           "+HTTP-PRECONDITION-FAILED+"
           "+HTTP-PROXY-AUTHENTICATION-REQUIRED+"
           "+HTTP-REQUEST-ENTITY-TOO-LARGE+"
           "+HTTP-REQUEST-TIME-OUT+"
           "+HTTP-REQUEST-URI-TOO-LARGE+"
           "+HTTP-REQUESTED-RANGE-NOT-SATISFIABLE+"
           "+HTTP-RESET-CONTENT+"
           "+HTTP-SEE-OTHER+"
           "+HTTP-SERVICE-UNAVAILABLE+"
           "+HTTP-SWITCHING-PROTOCOLS+"
           "+HTTP-TEMPORARY-REDIRECT+"
           "+HTTP-UNSUPPORTED-MEDIA-TYPE+"
           "+HTTP-USE-PROXY+"
           "+HTTP-VERSION-NOT-SUPPORTED+"
           "ABORT-REQUEST-HANDLER"
           "ACCEPTOR"
           "ACCEPTOR-ACCESS-LOGGER"
           "ACCEPTOR-ADDRESS"
           "ACCEPT-CONNECTIONS"
           "ACCEPTOR-REQUEST-DISPATCHER"
           "ACCEPTOR-INPUT-CHUNKING-P"
           "ACCEPTOR-MESSAGE-LOGGER"
           "ACCEPTOR-NAME"
           "ACCEPTOR-OUTPUT-CHUNKING-P"
           "ACCEPTOR-PERSISTENT-CONNECTIONS-P"
           "ACCEPTOR-PORT"
           "ACCEPTOR-READ-TIMEOUT"
           "ACCEPTOR-REPLY-CLASS"
           "ACCEPTOR-REQUEST-CLASS"
           "ACCEPTOR-SSL-P"
           #-:hunchentoot-no-ssl "ACCEPTOR-SSL-CERTIFICATE-FILE"               
           #-:hunchentoot-no-ssl "ACCEPTOR-SSL-PRIVATEKEY-FILE"
           #-:hunchentoot-no-ssl "ACCEPTOR-SSL-PRIVATEKEY-PASSWORD"
           "ACCEPTOR-WRITE-TIMEOUT"
           "AUTHORIZATION"
           "AUX-REQUEST-VALUE"
           "CONTENT-LENGTH"
           "CONTENT-LENGTH*"
           "CONTENT-TYPE"
           "CONTENT-TYPE*"
           "COOKIE-DOMAIN"
           "COOKIE-EXPIRES"
           "COOKIE-HTTP-ONLY"
           "COOKIE-IN"
           "COOKIE-NAME"
           "COOKIE-OUT"
           "COOKIE-PATH"
           "COOKIE-SECURE"
           "COOKIE-VALUE"
           "COOKIES-IN"
           "COOKIES-IN*"
           "COOKIES-OUT"
           "COOKIES-OUT*"
           "CREATE-FOLDER-DISPATCHER-AND-HANDLER"
           "CREATE-PREFIX-DISPATCHER"
           "CREATE-REGEX-DISPATCHER"
           "CREATE-STATIC-FILE-DISPATCHER-AND-HANDLER"
           "DEFAULT-DISPATCHER"
           "DEFINE-EASY-HANDLER"
           "DELETE-AUX-REQUEST-VALUE"
           "DELETE-SESSION-VALUE"
           "DISPATCH-EASY-HANDLERS"
           "ESCAPE-FOR-HTML"
           "EXECUTE-ACCEPTOR"
           "GET-PARAMETER"
           "GET-PARAMETERS"
           "GET-PARAMETERS*"
           "HANDLE-INCOMING-CONNECTION"
           "HANDLE-IF-MODIFIED-SINCE"
           "HANDLE-REQUEST"
           "HANDLE-STATIC-FILE"
           "HEADER-IN"
           "HEADER-IN*"
           "HEADER-OUT"
           "HEADERS-IN"
           "HEADERS-IN*"
           "HEADERS-OUT"
           "HEADERS-OUT*"
           "HOST"
           "HTTP-TOKEN-P"
           "HUNCHENTOOT-CONDITION"
           "HUNCHENTOOT-ERROR"
           "HUNCHENTOOT-WARNING"
           "INITIALIZE-CONNECTION-STREAM"
           "LOG-MESSAGE"
           "MAYBE-INVOKE-DEBUGGER"
           "MIME-TYPE"
           "NEXT-SESSION-ID"
           "NO-CACHE"
           "ONE-THREAD-PER-CONNECTION-TASKMASTER"
           "PARAMETER"
           "PARAMETER-ERROR"
           "POST-PARAMETER"
           "POST-PARAMETERS"
           "POST-PARAMETERS*"
           "PROCESS-CONNECTION"
           "PROCESS-REQUEST"
           "QUERY-STRING"
           "QUERY-STRING*"
           "RAW-POST-DATA"
           "REAL-REMOTE-ADDR"
           "REASON-PHRASE"
           "RECOMPUTE-REQUEST-PARAMETERS"
           "REDIRECT"
           "REFERER"
           "REMOTE-ADDR"
           "REMOTE-ADDR*"
           "REMOTE-PORT"
           "REMOTE-PORT*"
           "REMOVE-SESSION"
           "REPLY"
           "REPLY-EXTERNAL-FORMAT"
           "REPLY-EXTERNAL-FORMAT*"
           "REQUEST"
           "REQUEST-ACCEPTOR"
           "REQUEST-METHOD"
           "REQUEST-METHOD*"
           "REQUEST-URI"
           "REQUEST-URI*"
           "REQUIRE-AUTHORIZATION"
           "RESET-CONNECTION-STREAM"
           "RESET-SESSIONS"
           "RESET-SESSION-SECRET"
           "RETURN-CODE"
           "RETURN-CODE*"
           "RFC-1123-DATE"
           "SCRIPT-NAME"
           "SCRIPT-NAME*"
           "SEND-HEADERS"
           "SERVER-PROTOCOL"
           "SERVER-PROTOCOL*"
           "SESSION"
           "SESSION-COOKIE-NAME"
           "SESSION-COOKIE-VALUE"
           "SESSION-CREATED"
           "SESSION-DB"
           "SESSION-DB-LOCK"
           "SESSION-GC"
           "SESSION-MAX-TIME"
           "SESSION-REMOTE-ADDR"
           "SESSION-TOO-OLD-P"
           "SESSION-USER-AGENT"
           "SESSION-VALUE"
           "SESSION-VERIFY"
           "SET-COOKIE"
           "SET-COOKIE*"
           "SHUTDOWN"
           "SINGLE-THREADED-TASKMASTER"
           #-:hunchentoot-no-ssl "SSL-ACCEPTOR"
           "SSL-P"
           "START"
           "START-LISTENING"
           "START-SESSION"
           "STOP"
           "TASKMASTER"
           "TASKMASTER-ACCEPTOR"
           "URL-DECODE"
           "URL-ENCODE"
           "USER-AGENT"))

