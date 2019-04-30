function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function _print_jobs
  set -l num_jobs (jobs -c | command wc -l)
  set -l purple (set_color --bold AB76E0)
  set -l normal (set_color normal)
  if [ $num_jobs -gt 0 ]
    echo -n -s $purple ' ' $num_jobs $normal
  end
end

function fish_prompt
  set -l yellow (set_color yellow)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l cwd (basename (prompt_pwd))

  echo -e ""

  _print_jobs

  echo -n -s ' ' $cwd $normal


  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_dirty) ]
      set git_info $yellow $git_branch
    else
      set git_info $green $git_branch
    end
    echo -n -s ' ' $git_info $normal
  end

  echo -n -s ' ' $normal

end
