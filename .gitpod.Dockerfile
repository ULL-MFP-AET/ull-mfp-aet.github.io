FROM gitpod/workspace-full

# Install github cli
RUN brew install gh
RUN git config --global alias.co checkout
RUN git config --global alias.ci commit
RUN git config --global alias.dir 'ls-tree --name-only -r'