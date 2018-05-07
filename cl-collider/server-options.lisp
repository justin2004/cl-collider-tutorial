(in-package :sc)

(defvar *sc-plugin-paths*)

(defstruct server-options
  (num-control-bus 4096)
  (num-audio-bus 128)
  (num-input-bus 8)
  (num-output-bus 8)
  (block-size 64)
  (hardware-buffer-size 0)
  (hardware-samplerate 0)
  (num-sample-buffers 1024)
  (max-num-nodes 1024)
  (max-num-synthdefs 1024)
  (realtime-mem-size 8192)
  (num-wire-buffers 64)
  (num-random-seeds 64)
  (load-synthdefs-p 1)
  (publish-to-rendezvous-p 1)
  (max-logins 64)
  (verbosity 0)
  (ugen-plugins-path (mapcar #'full-pathname *sc-plugin-paths*)))

(defun build-server-options (server-options)
  (format nil "-c ~a -a ~a -i ~a -o ~a -z ~a ~@[-Z ~a~] -S ~a -b ~a -n ~a -d ~a -m ~a -w ~a -r ~a -D ~a -R ~a -l ~a -V ~a  ~@[-U \"~{~a~^:~}\"~]"
  	  (server-options-num-control-bus server-options)
  	  (server-options-num-audio-bus server-options)
  	  (server-options-num-input-bus server-options)
  	  (server-options-num-output-bus server-options)
  	  (server-options-block-size server-options)
  	  nil ;;(server-options-hardware-buffer-size server-options)
  	  (server-options-hardware-samplerate server-options)
  	  (server-options-num-sample-buffers server-options)
  	  (server-options-max-num-nodes server-options)
  	  (server-options-max-num-synthdefs server-options)
  	  (server-options-realtime-mem-size server-options)
  	  (server-options-num-wire-buffers server-options)
  	  (server-options-num-random-seeds server-options)
  	  (server-options-load-synthdefs-p server-options)
  	  (server-options-publish-to-rendezvous-p server-options)
  	  (server-options-max-logins server-options)
  	  (server-options-verbosity server-options)
	  (server-options-ugen-plugins-path server-options)))